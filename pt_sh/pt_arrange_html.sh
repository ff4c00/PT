#!/bin/bash
echo -e "请输入需要合并的关键字:";read -e merge_key;
echo "`cd part/;ls | grep "${merge_key}";`";
echo -e "是否对上述文件进行合并(y/n)?";read -e choice;
case ${choice} in
	y|Y|yes|YES)
		if [! -f "part_html/{merge_key}.html"];then
			touch part_html/${merge_key}.html;
		fi
		pt_file_path="part_html/${merge_key}.html"

		cat part.css | tee -ai ${pt_file_path};
	::
	*)
		echo "合并已终止:)"		
	::
esac


