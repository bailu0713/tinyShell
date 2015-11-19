#!/bin/sh
nowdate=`date -d now +"%Y-%m-%d"`
seconds=`date -d "$nowdate" +%s`
timespan=100
for ((day=$timespan;day>=1;day--));
do
dates=`date -d @$seconds +"%Y%m%d"`
echo $dates

# -c 断点续传, -t 重试次数 0 表示无穷次，知道成功, -T 等待时间
wget -t 2 -T 10 http://lafnews.com/corpus/news."$dates".tar.gz
echo "wget tar.gz file from http://lafnews.com/corpus/ .........................."$dates
seconds=$((seconds-86400))
done


