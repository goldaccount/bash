#!/bin/zsh
#
#Automatically generate image gallery with shopee images and links
#
#Images format must be <shopID>.<itemID>_xx.jpeg
echo '<html> \
<body>' > a.html
for x in *.jpeg;
do;
	url_img=$x
	url_item="https://shopee.vn/product/"${${x/_*.jpeg/}/\./\/}

	echo "<a href=\""${url_item}\""><img src=\""${url_img}"\" width=33%></img></a>" >> a.html 
done;

echo '</body>
</html>
' >> a.html
#
#Residual elements
#	echo ${${x/-/\/}/.//} | sed -E 's/\/vn\./.vn\//' 
# 	| sed -E 's/_[0-9a-z]\.jpeg//'
# 	| sed -E 's/_[0-9a-z]\.jpeg//')
#	| sed -E 's/\/vn\./.vn\//' | sed -E 's/_[0-9a-z]\.jpeg//')
