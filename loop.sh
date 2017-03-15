#value=curl 'http://35.163.220.202:8080/job/iTrust/ws/tests.json' | jq -r '.count'
#echo $value
CT="Content-Type:application/json"
TEST="wget http://35.163.220.202:8080/job/iTrust/ws/tests.json >> tests.json" 
value=($(jq -r '.count' tests.json))
echo $value 
