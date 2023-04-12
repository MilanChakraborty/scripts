#! /bin/zsh

for FILE in $@ 
do
  sed -i "" "s/function \(.*\)\((.*)\)/const \1 = function \2/" $FILE
done
