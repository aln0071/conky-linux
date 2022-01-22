FILE=/tmp/tottime.txt;
if [ ! -f "$FILE" ]; then
	hours=0;
	minutes=0;
	for i in $(last -s today | grep alan | tail -n +2 | awk '{print $10}' | cut -c 2-6)
	do
		IFS=':' read -ra TIME <<< "$i";
		minutes=$minutes+${TIME[1]};
		hours=$hours+${TIME[0]};
	done;

	thr=$(echo $hours | bc)
	tmin=$(echo $minutes | bc)
	thr=$(echo $thr+$tmin/60 | bc)
	tmin=$(echo $tmin%60 | bc)
	echo $thr"h" $tmin"m" > /tmp/tottime.txt;
fi
head -n 1 /tmp/tottime.txt;
