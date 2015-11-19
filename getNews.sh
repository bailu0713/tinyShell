#!/bin/sh
nowdate=`date -d now +"%Y-%m-%d"`
seconds=`date -d "$nowdate" +%s`
timespan=100
for ((day=$timespan;day>=1;day--));
do
dates=`date -d @$seconds +"%Y%m%d"`
echo $dates

# -c 断点续传, -t 重试次数 0 表示无穷次，知道成功, -T 等待时间
#-c 断点续传 
#-r 递归下载，下载指定网页某一目录下（包括子目录）的所有文件 
#-nd 递归下载时不创建一层一层的目录，把所有的文件下载到当前目录 
#-np 递归下载时不搜索上层目录。

wget -t 2 -T 10 http://lafnews.com/corpus/news."$dates".tar.gz
echo "wget tar.gz file from http://lafnews.com/corpus/ .........................."$dates
seconds=$((seconds-86400))
done


