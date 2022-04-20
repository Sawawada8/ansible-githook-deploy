#!/bin/bash
# echo $(pwd -P)

E=$( cd "$( dirname "$0" )" && pwd -P )
echo $E/aaa

str="ubuntu debian redhat suse"
ary=(`echo $str`)   # 配列に格納
echo $ary
echo ${#ary[@]}     # 配列の要素数を表示
# 表示
for i in `seq 1 ${#ary[@]}`
do
  echo ${ary[$i-1]}
done
