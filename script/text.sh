#!/usr/bin/env bash
###
##
#
URLLIST=$(egrep "com|cn" ./url.txt)
for url in ${URLLIST}; do
        statuCode=$(curl -I --connect-timeout 3 -m 10 -s ${url} | grep "HTTP") # -s 不显示进度或错误信息
        if [[ ${statuCode:9:3} -eq 200 ]] || [[ ${statuCode:9:3} -eq 302 ]] ;then
                echo "$(date +'%Y-%m-%d %H:%M:%S' ) -run monitor program ${url} is OK" >>/var/log/urlmonitor.log
        else
                echo "$(date +'%Y-%m-%d %H:%M:%S' ) -run monitor program ${url} is FAILED" >>/var/log/urlmonitor.log
                echo "[ERROR] ${url} Downtime! Please repair." | mail -s "warnning website" 1902750578@qq.com
  fi
done
