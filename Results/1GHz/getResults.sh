#! /bin/bash

a=$(find ./ -name "stats.txt")
for word in $a
do
	echo $word
	echo "------------------------------------------------------"
	echo $(sed '16q;d' $word)
	echo $(sed '343q;d' $word)
	echo $(sed '124q;d' $word)
	echo $(sed '491q;d' $word)
	echo ""
	
done
