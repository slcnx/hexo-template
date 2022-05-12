echo -ne "Enter a \033[1;31mtitle\033[0m for your blog: "; read title
[ $? -ne 0 ] && echo 'exit' && sleep 3 && exit 1
[ -z "$title" ] && echo title must be exists. && sleep 3 && exit 1
npx hexo new "$title"

start $(readlink -f .)/source/_posts