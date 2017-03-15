dir='src/main/edu/ncsu/csc/itrust'
dir_main='iTrust'
cd $dir_main
git checkout testcases
max=10 #Number of testcase iterations
for ((i=1; i <= $max; ++i))
do
	cd $dir
	input_num=$(( ( RANDOM % 10 )  + 1 )) #Choosing random number of files between 1-10
	for ((j=1; j<=$input_num; ++j))
	do
		file=`find . -type f -name '*.java' | shuf -n 1`
		op_num=$(( ( RANDOM % 3 )  + 1 )) #Choosing random operation (1=string replace 2=swap < with >)
		if (($op_num == 1))
		then
			sed -i 's/".*"/"hello"/g' $file
		fi
		if (($op_num == 2))
		then
			sed -i 's/for\(.*\)</for\1>/g' $file
		fi
		#echo "$input_num $op_num $file"
	done
	cd ~
	cd $dir_main
	git checkout testcases
	git add .
	git commit -am "Testcase"
	git push origin testcases
	sleep 20
	git checkout testcases
	git fetch --all
	git reset --hard origin/master	
done
git checkout testcases
git add .
git commit -am "Finished"
git push origin testcases

