sed -i -e :a -e 's/<[^>]*>//g;/</N;//ba;s/^[ \t]*//;s/[ \t]*$//' sensors.html
sed -i 's/'"$(printf '\015')"'$//g' sensors.html
sed -i '/^$/d' sensors.html
cat sensors.html
