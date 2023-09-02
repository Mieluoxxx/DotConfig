#!/bin/bash

# 检查传入参数
if [ $# -ne 1 ]; then
  echo "Usage: $0 <project_name>"
  exit 1
fi
project_name=$1

# 生成项目目录
mkdir $project_name
cd $project_name

# 定义目录结构
structure=(
  "README.md"
  "data/"
  "main.ipynb"
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

echo "Project $project_name generated successfully!"