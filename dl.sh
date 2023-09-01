#!/bin/bash

# 检查pyenv是否已安装
if [ ! -d "$HOME/.pyenv" ]; then
  # 询问是否安装
  read -p "检测到未安装pyenv，是否安装pyenv？[Y/n]" ans
  ans=${ans:-Y} # 默认为Y

  if [ "$ans" = "Y" ] || [ "$ans" = "y" ]; then
    # 执行安装pyenv的命令
    # 请根据您的操作系统和偏好选择适当的安装方法
    echo "正在安装pyenv..."
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
	echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
	echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
	echo 'eval "$(pyenv init -)"' >> ~/.zshrc
    echo "安装完成。"
  else
    echo "没有安装pyenv。"
  fi
fi


# 检查poetry是否安装
if ! command -v poetry &> /dev/null; then

  # 询问是否安装
  read -p "检测到未安装poetry，是否安装poetry？[Y/n]" ans
  ans=${ans:-Y} # 默认为Y
  
  if [ "$ans" = "Y" ] || [ "$ans" = "y" ]; then
    # 执行安装poetry的命令
    pip install poetry
	poetry config virtualenvs.in-project true
  else
    echo "未安装poetry，脚本退出。"
    exit 1
  fi
fi


# 检查传入参数
if [ $# -ne 1 ]; then
  echo "Usage: $0 <project_name>"
  exit 1
fi
project_name=$1


# 生成项目目录
mkdir $project_name
cd $project_name


# 初始化poetry
read -p "请输入Python版本(例如 3.11.4):" v

# 检查用户是否提供了Python版本，如果没有，则获取当前环境的Python版本
if [ -z "$v" ]; then
  v=$(python --version 2>&1 | awk '{print $2}')
fi

# 使用Poetry初始化项目
poetry init -n --author "$USER" --python "^$v"

# 创建并激活项目目录的 pyenv 环境
wget "https://registry.npmmirror.com/binary.html?path=python/$v/Python-$v.tar.xz" -O ~/.pyenv/cache/Python-$v.tar.xz
pyenv install $v 
pyenv local $v    # 设置项目的 Python 版本
zsh

# 定义目录结构
structure=(
  "README.md"
  "data/raw"
  "data/processed"
  "src/models"
  "src/utils"
  "src/preprocessing.py"
  "src/train.py"
  "src/evaluate.py" 
  "src/predict.py"
  "saved_models/"
  "logs/"
  "results/"  
)
for item in ${structure[@]}; do
  if [[ $item == *"/"* ]]; then
    # 包含/,生成目录
    mkdir -p $item
  else
    # 不包含/,生成文件
    touch $item 
  fi  
done

# 自动在README.md写入目录结构
echo "
|- README.md             项目说明
|- data/                 数据目录
    |- raw/              原始数据
    |- processed/        预处理后的数据
|- src/                  源代码目录  
    |- models/           模型定义
    |- utils/            各种utility函数
    |- preprocessing.py  数据预处理
    |- train.py          训练脚本
    |- evaluate.py       评估脚本
    |- predict.py        预测脚本
|- saved_models/         保存的模型
|- logs/                 日志目录  
|- results/              结果目录
|- pyproject.toml        环境依赖 
" > README.md

# 选择项目框架
echo "请选择项目框架:"
select framework in "机器学习" "Tensorflow" "PyTorch" "Jax"; do
  case $framework in
    "机器学习")
      # 安装scikit-learn等机器学习包
	  poetry add pandas matplotlib scikit-learn
      ;;
    "Tensorflow")
      # 安装TensorFlow
      read -p "请选择Tensorflow版本(2.6或最新):" tf_version
	  poetry add pandas matplotlib tensorflow
      ;;  
    "PyTorch")
      # 安装PyTorch
	  read -p "请选择PyTorch版本(推荐1.13.1或2.0.1):" torch_version
	    poetry add pandas matplotlib torch
      ;;
    "Jax")
      # 安装Jax
      poetry add jax
      ;;
  esac
  break
done


# 在项目中创建虚拟环境并安装依赖(二次保证自己想要的Python版本)
poetry env use $v
poetry install

echo "Project $project_name generated successfully!"
