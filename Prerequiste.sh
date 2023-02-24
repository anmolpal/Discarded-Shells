#bin/bash
#sudo touch Preq.txt
#sudo chmod 777 Preq.txt
yes | sudo apt-get update
yes | sudo apt-get upgrade
yes | sudo apt install jq
cd /usr/local/
sudo mkdir txt
sudo chmod 777 txt
cd /usr/local/txt
sudo touch python.txt
sudo chmod 777 python.txt
python3 --version > /usr/local/txt/python.txt
python=`awk 'FNR ==1 {print $1}' /usr/local/txt/python.txt`
if [[ $python == *Python* ]]
then
    echo "==================================================================="
    echo "Python is already Installed in your System. Below is the Version"
    python3 --version
    sudo rm python.txt
    echo "==================================================================="
else
    echo "*******************************************************************"
    echo "Python.exe is required"
    sudo rm python.txt
    echo "*******************************************************************"
fi

cd /usr/local/

sudo chmod 777 txt
cd /usr/local/txt/
sudo touch java.txt
sudo chmod 777 java.txt
sudo apt list --installed | grep -i openjdk > /usr/local/txt/java.txt
java=`awk 'FNR ==1 {print $1}' /usr/local/txt/java.txt`
#echo $java
if [[ $java == *openjdk-8-jdk* ]]
then
    echo "==================================================================="
    echo "Java is already Installed in your System. Below is the Version"
    java -version
    #sudo rm java.txt
    echo "==================================================================="
else
    echo "*******************************************************************"
    echo "Java 8 is required"
    #sudo rm java.txt
    echo "*******************************************************************"
    echo " "
fi

cd /usr/local/

sudo chmod 777 txt
cd /usr/local/txt/
sudo touch hadoop.txt
sudo chmod 777 hadoop.txt
hadoop version > /usr/local/txt/hadoop.txt
hadoop=`awk 'FNR ==1 {print $1}' /usr/local/txt/hadoop.txt`
#echo $hadoop
if [[ $hadoop == *Hadoop* ]]
then
    echo " "
    echo "==================================================================="
    echo "Hadoop is already Installed in your System. Below is the Version"
    hadoop version
    #sudo rm hadoop.txt
    echo "==================================================================="
else
    echo " "
    echo "*******************************************************************"
    echo "Hadoop is required"
    #sudo rm hadoop.txt
    echo "*******************************************************************"
    echo " "
fi

cd /usr/local/

sudo chmod 777 txt
cd /usr/local/txt/
sudo touch typescript
sudo chmod 777 typescript
sudo touch pyspark.txt
sudo chmod 777 pyspark.txt
script -c "pyspark --version" > /usr/local/txt/pyspark.txt
pyspark=`awk 'FNR ==6 {print $5}' /usr/local/txt/pyspark.txt`
#echo $pyspark
if [[ $pyspark == *3* ]]
then
    echo " "
    echo "==================================================================="
    echo "Spark is already Installed in your System. Below is the Version"
    pyspark --version
    #sudo rm pyspark.txt
    echo "==================================================================="
else
    echo " "
    echo "*******************************************************************"
    echo "Spark is required"
    #sudo rm pyspark.txt
    echo "*******************************************************************"
    echo " "
fi

cd /usr/local/

sudo chmod 777 txt
cd /usr/local/txt/
sudo touch airflow.txt
sudo chmod 777 airflow.txt
airflow version > /usr/local/txt/airflow.txt
airflow=`awk 'FNR ==1 {print $1}' /usr/local/txt/airflow.txt`
if [[ $airflow == *2* ]]
then
    echo " "
    echo "==================================================================="
    echo "Airflow is already Installed in your System. Below is the Version"
    airflow version
    #sudo rm airflow.txt
    echo "==================================================================="
else
    echo " "
    echo "*******************************************************************"
    echo "Airflow is not in your System."
    #sudo rm airflow.txt
    echo "*******************************************************************"
    echo " "
fi

cd /usr/local/

sudo chmod 777 txt
cd /usr/local/txt/
sudo touch hive.txt
sudo chmod 777 hive.txt
#script -c "hive --version" > /usr/local/txt/hive.txt
hive --version > hive.txt
hive=`awk 'FNR ==1 {print $1}' /usr/local/txt/hive.txt`
hiveV=`awk 'FNR ==1 {print $2}' /usr/local/txt/hive.txt`
if [[ $hive == *Hive* ]]
then
    echo " "
    echo "==================================================================="
    echo "Hive is already Installed in your System. Below is the Version"
    hive --version
    #sudo rm hive.txt
    echo "==================================================================="
else
    echo " "
    echo "*******************************************************************"
    echo "Hive is not in your System."
    #sudo rm hive.txt
    echo "*******************************************************************"
    echo " "
fi

cd /usr/local/

sudo chmod 777 txt
cd /usr/local/txt/
sudo touch mysql.txt
sudo chmod 777 mysql.txt
mysql --version > /usr/local/txt/mysql.txt
mysql=`awk 'FNR ==1 {print $1}' /usr/local/txt/mysql.txt`
if [[ $mysql == *mysql* ]]
then
    echo " "
    echo "==================================================================="
    echo "MySQL is already Installed in your System. Below is the Version"
    mysql --version
    #sudo rm mysql.txt
    echo "==================================================================="
else
    echo " "
    echo "*******************************************************************"
    echo "MySQL is not in your System."
    #sudo rm mysql.txt
    echo "*******************************************************************"
    echo " "
fi

cd /usr/local/

sudo chmod 777 txt
cd /usr/local/txt/
sudo touch mssql.txt
sudo chmod 777 mssql.txt
dpkg -l | grep -i mssql-server > /usr/local/txt/mssql.txt
mssql=`awk 'FNR ==1 {print $2}' /usr/local/txt/mssql.txt`
if [[ $mssql == *mssql-server* ]]
then
    echo " "
    echo "==================================================================="
    echo "MS SQL Server is already Installed in your System. Below is the Version"
    dpkg -l | grep -i mssql-server
    #sudo rm mssql.txt
    echo "==================================================================="
else
    echo " "
    echo "*******************************************************************"
    echo "MS SQL Server is not in your System."
    #sudo rm mssql.txt
    echo "*******************************************************************"
    echo " "
fi

cd /usr/local/

sudo chmod 777 txt
cd /usr/local/txt/
sudo touch postgres.txt
sudo chmod 777 postgres.txt
psql -V > /usr/local/txt/postgres.txt
postgres=`awk 'FNR ==1 {print $1}' /usr/local/txt/postgres.txt`
if [[ $postgres == *psql* ]]
then
    echo " "
    echo "==================================================================="
    echo "Postgres is already Installed in your System. Below is the Version"
    psql -V
    #sudo rm postgres.txt
    echo "==================================================================="
else
    echo " "
    echo "*******************************************************************"
    echo "Postgres is not in your System."
    #sudo rm postgres.txt
    echo "*******************************************************************"
    echo " "
fi

cd /usr/local/

sudo chmod 777 txt
cd /usr/local/txt/
sudo touch mongo.txt
sudo chmod 777 mongo.txt
mongo --version > /usr/local/txt/mongo.txt
mongo=`awk 'FNR ==1 {print $1}' /usr/local/txt/mongo.txt`
if [[ $mongo == *Mongo* ]]
then
    echo " "
    echo "==================================================================="
    echo "MongoDB is already Installed in your System. Below is the Version"
    mongo --version
    #sudo rm mongo.txt
    echo "==================================================================="
else
    echo " "
    echo "*******************************************************************"
    echo "MongoDB is not in your System."
    #sudo rm mongo.txt
    echo "*******************************************************************"
    echo " "
fi

cd /usr/local/
spark1=`jq '.sparkVersion' info.json`
hadoop1=`jq '.hadoopVersion' info.json`
java1=`jq '.java' info.json`

cd /usr/local/txt/
sudo touch spark2
sudo chmod 777 spark2
sudo touch hadoop2
sudo chmod 777 hadoop2
sudo touch java2
sudo chmod 777 java2

echo $spark1 | sed "s/['\"]//g" > spark2
echo $hadoop1 | sed "s/['\"]//g" > hadoop2
echo $java1 | sed "s/['\"]//g" > java2

javasrc=`awk 'FNR ==1 {print $1}' /usr/local/txt/java.txt`

#Checking New Version#
hadoopsrc=`awk 'FNR ==1 {print $2}' /usr/local/txt/hadoop.txt`

#Checking Old Version#
hadoopold=`awk 'FNR ==1 {print $1}' /usr/local/txt/hadoop.txt`

#Checking New Version#
pysparksrc=`awk 'FNR ==6 {print $5}' /usr/local/txt/pyspark.txt`

#Checking Old Version#
pysparkold=`awk 'FNR ==6 {print $4}' /usr/local/txt/pyspark.txt`

#Checking New Version#
hivesrc=`awk 'FNR ==1 {print $2}' /usr/local/txt/hive.txt`

#Checking Old Version#
hiveold=`awk 'FNR ==7 {print $1}' /usr/local/txt/hive.txt`

airflowsrc=`awk 'FNR ==1 {print $1}' /usr/local/txt/airflow.txt`

#Checking New Version#
postgressrc=`awk 'FNR ==1 {print $3}' /usr/local/txt/postgres.txt`

mysqlsrc=`awk 'FNR ==1 {print $5}' /usr/local/txt/mysql.txt`

#Checking New Version#
mongosrc=`awk 'FNR ==1 {print $4}' /usr/local/txt/mongo.txt`

#Checking Old Version#
mongoold=`awk 'FNR ==1 {print $1}' /usr/local/txt/mongo.txt`

#Checking New Version#
mssqlsrc=`awk 'FNR ==1 {print $3}' /usr/local/txt/mssql.txt`

#Checking old Version#
mssqlold=`awk 'FNR ==1 {print $5}' /usr/local/txt/mssql.txt`

# if [[ $python == *Python* ]] && [[ $javasrc == *8* ]] && [[ $hadoopsrc == *3.3.2*  &&  $pysparksrc == *3.2.2* ]] \
# || [[ $hadoopsrc == *3.2.3*  &&  $pysparksrc == *3.1.3* ]] \
# && [[ $hivesrc == *3.1.2* ]] && [[ $airflowsrc == *2.3.3* ]]
# then
#     echo "Requirements are met"
#     echo "0"
# else
#     echo "Requirements are not met"
#     echo "1"
# fi
#if [[ $python == *Python* ]] && [[ $javasrc == *8* ]] &&   &&  $pysparksrc == *3.2.2* ]] \
#||   &&  $pysparksrc == *3.1.3* ]]

#####################################################Checking for Hadoop##########################################

if [[ $hadoopsrc == *3.3.2* ]] || [[ $hadoopsrc == *3.2.3* ]]
then 
    readarray -t array <<< "$(df -h)";
    var=$(echo "${array[1]}"| grep -aob '%' | grep -oE '[0-9]+');
    df_output="${array[3]:$var-3:4}";
    HADOOP=0
    #{"hadoopN":"%s"} "$hadoopN"
    printf '[{"module":"HADOOP","output":"%s","msg":"HADOOP is already Installed","v":"'$hadoopsrc'"}, \n' "$HADOOP"
elif [[ $hadoopold == *Hadoop* ]]  
then    
    readarray -t array <<< "$(df -h)";
    var=$(echo "${array[1]}"| grep -aob '%' | grep -oE '[0-9]+');
    df_output="${array[3]:$var-3:4}";
    HADOOP=1
    #{"HADOOP":"%s"} "$HADOOP"
    printf '[{"module":"HADOOP","output":"%s","msg":"Older version of HADOOP is found","v":"'$hadoopsrc'"}, \n' "$HADOOP"
else
    readarray -t array <<< "$(df -h)";
    var=$(echo "${array[1]}"| grep -aob '%' | grep -oE '[0-9]+');
    df_output="${array[3]:$var-3:4}";
    #Not Found
    HADOOP=2
    #{"hadoopNF":"%s"} "$hadoopNF"
    printf '[{"module":"HADOOP","output":"%s","msg":"HADOOP not found"}, \n' "$HADOOP"
fi  

#####################################################Checking for Spark##########################################

if [[ $pysparksrc == *3.2.2* ]] || [[ $pysparksrc == *3.1.3* ]]
then 
    readarray -t array <<< "$(df -h)";
    var=$(echo "${array[1]}"| grep -aob '%' | grep -oE '[0-9]+');
    df_output="${array[3]:$var-3:4}";
    SPARK=0
    #pysparksrc=`awk 'FNR ==6 {print $5}' /usr/local/txt/pyspark.txt`
    #{"sparkN":"%s"} "$sparkN"
    usr=`jq '.user' /usr/local/info.json`
    sudo touch /usr/local/etc/preuser.txt
    sudo chmod 777 /usr/local/etc/preuser.txt
    echo $usr | sed "s/['\"]//g" > /usr/local/etc/preuser.txt
    usr=`awk 'FNR ==1 {print $1}' /usr/local/etc/preuser.txt`
    pysparksrc=`awk 'FNR ==1 {print $1}' /home/$usr/.local/lib/python3.6/site-packages/pyspark/version.py`
    pysparksrc1=`sed 's/^.............//;s/.$//' /home/$usr/.local/lib/python3.6/site-packages/pyspark/version.py`
    printf ' {"module":"SPARK","output":"%s","msg":"SPARK is already Installed","v":"'$pysparksrc1'"}, \n' "$SPARK"
elif [[ $sparkold == *spark* ]]  
then    
    readarray -t array <<< "$(df -h)";
    var=$(echo "${array[1]}"| grep -aob '%' | grep -oE '[0-9]+');
    df_output="${array[3]:$var-3:4}";
    SPARK=1
    #{"sparkOld":"%s"} "$sparkOld"
    printf ' {"module":"SPARK","output":"%s","msg":"Older version of SPARK is found","v":"'$pysparksrc1'"}, \n' "$SPARK"
else
    readarray -t array <<< "$(df -h)";
    var=$(echo "${array[1]}"| grep -aob '%' | grep -oE '[0-9]+');
    df_output="${array[3]:$var-3:4}";
    #Not Found
    SPARK=2
    #{"sparkNF":"%s"} "$sparkNF"
    printf ' {"module":"SPARK","output":"%s","msg":"SPARK not found"}, \n' "$SPARK"
fi 

#####################################################Checking for Airflow##########################################

if [[ $airflowsrc == *2.3.3* ]] || [[ $airflowsrc == *2.2.3* ]] || [[ $airflowsrc == *2.2.4* ]] || [[ $airflowsrc == *2.2.2* ]] || [[ $airflowsrc == *2.2.5* ]]
then 
    readarray -t array <<< "$(df -h)";
    var=$(echo "${array[1]}"| grep -aob '%' | grep -oE '[0-9]+');
    df_output="${array[3]:$var-3:4}";
    AIRFLOW=0
    #{"AIRFLOWN":"%s"} "$AIRFLOWN"
    printf ' {"module":"AIRFLOW","output":"%s","msg":"AIRFLOW is already Installed","v":"'$airflowsrc'"}, \n' "$AIRFLOW"
elif [[ $airflowsrc == *1.10.15* ]] || [[ $airflowsrc == *1.10.14* ]] || [[ $airflowsrc == *1.10.13* ]] || [[ $airflowsrc == *1.10.12* ]] || [[ $airflowsrc == *1.10.11* ]] || [[ $airflowsrc == *1.10.10* ]]
then    
    readarray -t array <<< "$(df -h)";
    var=$(echo "${array[1]}"| grep -aob '%' | grep -oE '[0-9]+');
    df_output="${array[3]:$var-3:4}";
    AIRFLOW=1
    #{"AIRFLOWOld":"%s"} "$AIRFLOWOld"
    printf ' {"module":"AIRFLOW","output":"%s","msg":"Older version of AIRFLOW is found","v":"'$airflowsrc'"}, \n' "$AIRFLOW"
else
    readarray -t array <<< "$(df -h)";
    var=$(echo "${array[1]}"| grep -aob '%' | grep -oE '[0-9]+');
    df_output="${array[3]:$var-3:4}";
    #Not Found
    AIRFLOW=2
    #{"AIRFLOWNF":"%s"} "$AIRFLOWNF"
    printf ' {"module":"AIRFLOW","output":"%s","msg":"AIRFLOW not found"}, \n' "$AIRFLOW"
fi

#####################################################Checking for HIVE##########################################

if [[ $hivesrc == *3.1.2* ]] 
then 
    readarray -t array <<< "$(df -h)";
    var=$(echo "${array[1]}"| grep -aob '%' | grep -oE '[0-9]+');
    df_output="${array[3]:$var-3:4}";
    HIVE=0
    #{"HIVEN":"%s"} "$HIVEN"
    printf ' {"module":"HIVE","output":"%s","msg":"HIVE is already Installed","v":"'$hivesrc'"}, \n' "$HIVE"
elif [[ $hiveold == *Hive* ]]  
then    
    readarray -t array <<< "$(df -h)";
    var=$(echo "${array[1]}"| grep -aob '%' | grep -oE '[0-9]+');
    df_output="${array[3]:$var-3:4}";
    HIVE=1
    #{"HIVEOld":"%s"} "$HIVEOld"
    printf ' {"module":"HIVE","output":"%s","msg":"Older version of HIVE is found","v":"'$hivesrc'"}, \n' "$HIVE"
else
    readarray -t array <<< "$(df -h)";
    var=$(echo "${array[1]}"| grep -aob '%' | grep -oE '[0-9]+');
    df_output="${array[3]:$var-3:4}";
    #Not Found
    HIVE=2
    #{"HIVENF":"%s"} "$HIVENF"
    printf ' {"module":"HIVE","output":"%s","msg":"HIVE not found"}, \n' "$HIVE"
fi

#####################################################Checking for Postgres##########################################

if [[ $postgressrc == *15* ]] || [[ $postgressrc == *14* ]] || [[ $postgressrc == *13* ]] || [[ $postgressrc == *12* ]] || [[ $postgressrc == *11* ]] || [[ $postgressrc == *10* ]]
then 
    readarray -t array <<< "$(df -h)";
    var=$(echo "${array[1]}"| grep -aob '%' | grep -oE '[0-9]+');
    df_output="${array[3]:$var-3:4}";
    POSTGRES=0
    #{"POSTGRESN":"%s"} "$POSTGRESN"
    printf ' {"module":"POSTGRES","output":"%s","msg":"POSTGRES is already Installed","v":"'$postgressrc'"}, \n' "$POSTGRES"
elif [[ $postgressrc == *9* ]] || [[ $postgressrc == *8* ]] || [[ $postgressrc == *7* ]] || [[ $postgressrc == *6* ]]
then    
    readarray -t array <<< "$(df -h)";
    var=$(echo "${array[1]}"| grep -aob '%' | grep -oE '[0-9]+');
    df_output="${array[3]:$var-3:4}";
    POSTGRES=1
    #{"POSTGRESOld":"%s"} "$POSTGRESOld"
    printf ' {"module":"POSTGRES","output":"%s","msg":"Older version of POSTGRES is found","v":"'$postgressrc'"}, \n' "$POSTGRES"
else
    readarray -t array <<< "$(df -h)";
    var=$(echo "${array[1]}"| grep -aob '%' | grep -oE '[0-9]+');
    df_output="${array[3]:$var-3:4}";
    #Not Found
    POSTGRES=2
    #{"POSTGRESNF":"%s"} "$POSTGRESNF"
    printf ' {"module":"POSTGRES","output":"%s","msg":"POSTGRES not found"}, \n' "$POSTGRES"
fi

#####################################################Checking for MySQL##########################################

if [[ $mysqlsrc == *8.0* ]] || [[ $mysqlsrc == *5.7* ]] 
then 
    readarray -t array <<< "$(df -h)";
    var=$(echo "${array[1]}"| grep -aob '%' | grep -oE '[0-9]+');
    df_output="${array[3]:$var-3:4}";
    MYSQL=0
    #{"MYSQLN":"%s"} "$MYSQLN"
    printf ' {"module":"MYSQL","output":"%s","msg":"MYSQL is already Installed","v":"'$mysqlsrc'"}, \n' "$MYSQL"
elif [[ $mysqlsrc == *5.6* ]] || [[ $mysqlsrc == *5.5* ]] || [[ $mysqlsrc == *5.1* ]] || [[ $mysqlsrc == *5.0* ]]
then    
    readarray -t array <<< "$(df -h)";
    var=$(echo "${array[1]}"| grep -aob '%' | grep -oE '[0-9]+');
    df_output="${array[3]:$var-3:4}";
    MYSQL=1
    #{"MYSQLOld":"%s"} "$MYSQLOld"
    printf ' {"module":"MYSQL","output":"%s","msg":"Older version of MYSQL is found","v":"'$mysqlsrc'"}, \n' "$MYSQL"
else
    readarray -t array <<< "$(df -h)";
    var=$(echo "${array[1]}"| grep -aob '%' | grep -oE '[0-9]+');
    df_output="${array[3]:$var-3:4}";
    #Not Found
    MYSQL=2
    #{"MYSQLNF":"%s"} "$MYSQLNF"
    printf ' {"module":"MYSQL","output":"%s","msg":"MYSQL not found"}, \n' "$MYSQL"
fi

#####################################################Checking for MongoDB##########################################

if [[ $mongosrc == *5.0* ]] || [[ $mongosrc == *4.4* ]] || [[ $mongosrc == *4.2* ]] || [[ $mongosrc == *4.0* ]] || [[ $mongosrc == *3.6.3* ]] || [[ $mongosrc == *3.6.8* ]]
then 
    readarray -t array <<< "$(df -h)";
    var=$(echo "${array[1]}"| grep -aob '%' | grep -oE '[0-9]+');
    df_output="${array[3]:$var-3:4}";
    MONGO=0
    #{"MONGON":"%s"} "$MONGON"
    printf ' {"module":"MONGO","output":"%s","msg":"MONGO is already Installed","v":"'$mongosrc'"}, \n' "$MONGO"
elif [[ $mongoold == *Mongo* ]]
then    
    readarray -t array <<< "$(df -h)";
    var=$(echo "${array[1]}"| grep -aob '%' | grep -oE '[0-9]+');
    df_output="${array[3]:$var-3:4}";
    MONGO=1
    #{"MONGOOld":"%s"} "$MONGOOld"
    printf ' {"module":"MONGO","output":"%s","msg":"Older version of MONGO is found","v":"'$mongosrc'"}, \n' "$MONGO"
else
    readarray -t array <<< "$(df -h)";
    var=$(echo "${array[1]}"| grep -aob '%' | grep -oE '[0-9]+');
    df_output="${array[3]:$var-3:4}";
    #Not Found
    MONGO=2
    #{"MONGONF":"%s"} "$MONGONF"
    printf ' {"module":"MONGO","output":"%s","msg":"MONGO not found"}, \n' "$MONGO"
fi

#####################################################Checking for MSSQL##########################################

if [[ $mssqlsrc == *15* ]] 
then 
    readarray -t array <<< "$(df -h)";
    var=$(echo "${array[1]}"| grep -aob '%' | grep -oE '[0-9]+');
    df_output="${array[3]:$var-3:4}";
    MSSQL=0
    #{"MSSQLN":"%s"} "$MSSQLN"
    printf ' {"module":"MSSQL","output":"%s","msg":"MSSQL is already Installed","v":"'$mssqlsrc'"}] \n' "$MSSQL"
elif [[ $mssqlold == *Microsoft* ]]
then    
    readarray -t array <<< "$(df -h)";
    var=$(echo "${array[1]}"| grep -aob '%' | grep -oE '[0-9]+');
    df_output="${array[3]:$var-3:4}";
    MSSQL=1
    #{"MSSQLOld":"%s"} "$MSSQLOld"
    printf ' {"module":"MSSQL","output":"%s","msg":"Older version of MSSQL is found","v":"'$mssqlsrc'"}] \n' "$MSSQL"
else
    readarray -t array <<< "$(df -h)";
    var=$(echo "${array[1]}"| grep -aob '%' | grep -oE '[0-9]+');
    df_output="${array[3]:$var-3:4}";
    #Not Found
    MSSQL=2
    #{"MSSQLNF":"%s"} "$MSSQLNF"
    printf ' {"module":"MSSQL","output":"%s","msg":"MSSQL not found"}] \n' "$MSSQL"
fi
echo " "
