echo -n "请输入片段的主题:";read -e title;

# 判断文件是否存在.不存在则新建
if [ ! -f "part/${title}.txt" ]; then
  touch part/${title}.txt;
fi

pt_file_path=part/${title}.txt;

echo "请输入各片段名称,以空格分隔";read -a outlines;

contents=()

# 记录内容
for outline in ${outlines[@]}
do
  echo -e "那么${outline}的具体内容";read -e -d "$" content; contents=( "${contents[@]}" "$content" );
done
# 记录内容END

# 写入文件
for ((i=0;i<${#contents[@]};i++))
{
 echo -e "${outlines[$i]}:${contents[$i]}," | tee -ai $pt_file_path;
}
# 写入文件END

echo "关于${title}的片段记录完毕."
