# 介绍
本项目内有两个shell脚本。一个是安装nginx，另一个是往本机安装一个指令，该指令的功能就是将选定文件/文件夹复制到nginx的路径，并输出一个下载链接
## 应用场景
在使用云服务器编译时，想要快速下载云服务器上的编译结果。nginx的功能就是静态文件服务器，下载速度快，还能断点续传。



# install_nginx.sh
安装配置文件服务器nginx
## 使用方法
```
	sudo bash install_nginx.sh
```
## 内部发生了什么
1. 使用apt安装nginx
2. 配置为文件服务器,路径为/Ndownload

# cmd_down.sh
安装自创指令ndown
## 使用方法
（因为服务器内无法获取外网地址，所以需要安装时手动输入）
```
	sudo bash cmd_down.sh 本机ip地址
```
示例:`sudo bash cmd_down.sh 175.178.105.49`
## 内部发生了什么
往路径`/usr/bin/`下创建一个文件，命名为`ndow`，这样在命令行下输入ndow就能调用这个文件。


# ndown指令
## 使用方法
直接ndown加上文件或文件夹的名字
```
	ndown 文件名
```
例如 `ndown a.txt` `ndown work/`
## 会发生什么
- 会将指定文件复制到`/Ndownload`路径下，如果是文件夹则会先压缩成zip文件。
- 然后返回一条下载链接


