dir='iTrust/src/main/edu/ncsu/csc/itrust'
dir_main='iTrust'
cd $dir
#git checkout testcases
max=1 #Number of testcase iterations
file="ParameterUtil.java"
for ((i=1; i <= $max; ++i))
do
	#cd $dir
	input_num=$(( ( RANDOM % 10 )  + 1 )) #Choosing random number of files between 1-10
	for ((j=1; j<=$input_num; ++j))
	do
		file=`grep -lR --include=*.java "for (.*)" | shuf -n 1`
		#file=`find . -type f -name '*.java' | shuf -n 1`
		op_num=$(( ( RANDOM % 5 ) )) #Choosing random operation (1=string replace 2=swap < with >)
		if (($op_num == 1))
		then
			file=`find . -type f -name '*.java' | shuf -n 1`
			sed -i 's/".*"/"hello"/g' $file
		fi
		if (($op_num == 2))
		then
			file=`grep -lR --include=*.java "for (.*<.*)" | shuf -n 1`
			sed -i 's/for\(.*\)</for\1>/g' $file
		fi
		if (($op_num == 3))
		then
			file=`grep -lR --include=*.java "if (.*<.*)" | shuf -n 1`
			sed -i 's/if\(.*\)</if\1>/g' $file
		fi
		if (($op_num == 4))
		then
			file=`grep -lR --include=*.java "if (.*==.*)" |shuf -n 1`
			sed -i 's/if\(.*\)==/if\1!=/g' $file
		fi
		echo "$input_num $op_num $file"
	done
	cd ~
	cd $dir_main
	#git checkout testcases
	#git add .
	#git commit -am "Testcase"
	#git push origin testcases
	#sleep 20
	#git checkout testcases
	#git fetch --all
	#git reset --hard origin/master	
done
#git checkout testcases
#git add .
#git commit -am "Finished"
#git push origin testcases
#COMMENT
#sed -i 's/for\(.*\)</for\1>/g' $file
#sed -i 's/if\(.*\)</if\1>/g' $file
#sed -i 's/if\(.*\)==/if\1!=/g' $file
#sed -i 's/if\(.*\)!=/if\1==/g' $file
