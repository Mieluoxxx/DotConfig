# DotConfig
---
## [dl.sh](https://github.com/Mieluoxxx/DotConfig/blob/main/dl.sh) 一键生成深度学习的模板 
优点:
- Poetry 可以追踪环境依赖，妈妈再也不用担心我丢包了
- Pyenv 可以控制Python的版本
- 一键生成深度学习模板，让项目更有规范（

缺点:
- 第一次使用Pyenv重新构建Python环境巨慢，md真不如conda，主要是因为我直接从源码编译python而非下载特定的二进制文件（如果本身~/.pyenv/cache中含有特定3.x的版本，构建速度效率会远超conda）
- 感觉不如docker
---

## [proxy-for-linux.sh](https://github.com/Mieluoxxx/DotConfig/blob/main/proxy-for-linux.sh) 一键为linux配置clash代理
优点：
- 全程国内加速
- 操作简单
缺点：
- 对/etc/profile.d/clash.sh 进行了 777 处理，对个人使用而言影响不大
- 将clash-for-linux本体放置在了~/Apps/文件夹中，个人习惯问题
参考地址:
[clash-for-linux](https://github.com/wanhebin/clash-for-linux)
