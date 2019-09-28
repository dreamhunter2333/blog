cd ..

hexo g

d1=`date +"%Y-%m-%d %H:%M:%S"`

cd source

git add --all

git commit -m "update at $d1"

git push

cd ..

cd public

git add --all

git commit -m "update at $d1"

git push

cd ..

hexo s
