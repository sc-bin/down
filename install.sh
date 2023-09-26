#!/bin/bash


echo "1.下载软件"
apt-get install nginx ufw -y

echo "2.创建路径 /Ndownload "
mkdir /Ndownload
chmod 777 /Ndownload

echo "3.创建配置文件"
cat>/etc/nginx/conf.d/file_server.conf<<EOF
server {
    listen  80;          # 监听端口
    server_name    _; 
    charset utf-8; # 避免中文乱码
    root /Ndownload;    # 文件路径
    location / {
        autoindex on; # 索引
        autoindex_exact_size on; # 显示文件大小
        autoindex_localtime on; # 显示文件时间
    }
}
EOF

rm /etc/nginx/sites-enabled/default
service nginx reload

echo "4.放行防火墙"
sudo ufw allow 'Nginx Full'


echo "5.安装down指令"
cat>/usr/bin/down<<EOF
#!/bin/bash

IP=$1
filename=\$1

if [ -f "\$filename" ]
then
	# echo '文件'
	cp \${filename} /Ndownload
	echo "下载链接："
	echo -e "\n\n\thttp://\${IP}/\${filename}\n\n"
fi


if [ -d "\$filename" ]
then
	dir=\$filename

	if [ "\${dir:0-1}" == "/" ]
	then
		tmp=\${dir%?}
		dir=\$tmp
	fi

	zip -r "/Ndownload/\${dir}.zip" \${dir}
	echo "下载链接："
	echo -e "\n\n\thttp://\${IP}/\${dir}.zip\n\n"
fi



EOF

chmod 777 /usr/bin/down
