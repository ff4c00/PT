echo -e "请输入片段关键字:";read -e key;
echo "`cd ${pt_file_path}/;ls | grep "${key}";`";
echo -n "请输入片段的主题:";read -e title;

# 判断文件是否存在.不存在则新建
if [ ! -f "${pt_file_path}/${key}_${title}.txt" ]; then
  touch ${pt_file_path}/${key}_${title}.txt;
fi

pt_file_path=${pt_file_path}/${key}_${title}.txt;

echo "请输入各片段名称,以空格分隔";read -a outlines;

contents=()

# 记录内容
for outline in ${outlines[@]}
do
  echo -e "那么${outline}的具体内容";read -e -d "~" content; contents=( "${contents[@]}" "$content" );
done
# 记录内容END

# 写入文件
for ((i=0;i<${#contents[@]};i++))
{
 echo -e "<h3>\n${outlines[$i]}<br>\n<span class=\"gray\">${pt_date}</span>\n</h3>" | tee -ai $pt_file_path;
 echo -e "<p>\n${contents[$i]}\n</p> \n" | tee -ai $pt_file_path;
}
# 写入文件END

echo "关于${title}的片段记录完毕."

