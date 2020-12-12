#! /bin/bash
#sort -s -k7 -k9
a=$(find ./ -name "stats.txt")
for word in $a
do
	icache=$(grep -n 'icache.overall_miss_rate::total' $word | cut -f1 -d:)
	dcache=$(grep -n 'dcache.overall_miss_rate::total' $word | cut -f1 -d:)
	l2=$(grep -n 'l2.overall_miss_rate::total' $word | cut -f1 -d:)
	
	echo $word
	echo "------------------------------------------------------"
	echo $(sed '16q;d' $word)
	echo $(sed "$((icache))q;d" $word)
	echo $(sed "$((dcache))q;d" $word)
	echo $(sed "$((l2))q;d" $word)
	echo ""
	
done
