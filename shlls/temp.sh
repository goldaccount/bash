for x in *temp*; do; atomic ${x/.temp/} --artwork=${x/temp.m4a/jpg} -W; done
