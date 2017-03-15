TEST="wget http://35.163.220.202:8080/job/iTrust/ws/tests.json >> tests.json" 
echo `$TEST`
value=($(jq -r '.count' tests.json))
echo $value
while [$value < 8]
do
	bash test.sh 
done
python reportGenerator.py >> report.txt
