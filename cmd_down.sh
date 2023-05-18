#!/bin/bash
echo "功能:安装自定义指令down"


cat>/usr/bin/ndown<<EOF
#!/bin/bash

IP=$1
filename=\$1

if [ -f "\$filename" ]
then
	echo '文件'
	cp \${filename} /Ndownload
	echo "下载链接："
	echo "http://\${IP}/\${filename}"
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
	echo "http://\${IP}/\${dir}.zip"
fi



EOF

chmod 777 /usr/bin/down


