#!/bin/sh
yes | sudo apt-get update
yes | sudo apt-get upgrade
yes | sudo apt install jq

cd /usr/local/
usar=`jq '.user' info.json`
sudo mkdir RP
sudo chmod 777 /usr/local/RP
sudo touch /usr/local/RP/usar1.txt
sudo chmod 777 /usr/local/RP/usar1.txt
echo $usar | sed "s/['\"]//g" > /usr/local/RP/usar1.txt
usar1=`awk 'FNR ==1 {print $1}' /usr/local/RP/usar1.txt`

####################################################### Removing HADOOOP ###############################################

cd /usr/local/
KockpitHadoop=`jq '.KOCKPIThadoop' KockpitInfo.json`
sudo touch /usr/local/RP/KH.txt
sudo chmod 777 /usr/local/RP/KH.txt
echo $KockpitHadoop | sed "s/['\"]//g" > /usr/local/RP/KH.txt
KH=`awk 'FNR ==1 {print $1}' /usr/local/RP/KH.txt`
THUMBS_UP='\U1F44D'
if [[ $KH == *yes* ]] 
then
    echo " "
    read -t 2 -p "<<<<<Removing Old Version of Hadoop>>>>>" 
    echo " "
    sudo touch hadoop.txt
    sudo chmod 777 hadoop.txt
    echo $HADOOP_HOME > hadoop.txt
    remove=`awk 'FNR ==1 {print $1}' /usr/local/hadoop.txt`
    #echo $remove
    sudo rm -rf $remove
    sudo rm -rf hadoop.txt    
    #sed -i '/PATH/d' /home/$usar1/.bashrc
    sed -i '/HADOOP_HOME/d' /home/$usar1/.bashrc
    sed -i '/HADOOP_MAPRED_HOME/d' /home/$usar1/.bashrc
    sed -i '/HADOOP_COMMON_HOME/d' /home/$usar1/.bashrc
    sed -i '/JAVA_HOME/d' /home/$usar1/.bashrc
    sed -i '/HADOOP_HDFS_HOME/d' /home/$usar1/.bashrc
    sed -i '/YARN_HOME/d' /home/$usar1/.bashrc
    sed -i '/HADOOP_CONF_DIR/d' /home/$usar1/.bashrc
    sed -i '/HADOOP_COMMON_local_NATIVE_DIR/d' /home/$usar1/.bashrc
    #sed -i '/mssql-tools/d' /home/$usar1/.bashrc
    sed -i '/LD_localRARY_PATH/d' /home/$usar1/.bashrc

    cd /home/$usar1/
    
    grep 'PATH' /home/$usar1/.bashrc | grep 'hadoop' >> bashline
    grep 'PATH' /home/$usar1/.bashrc | grep 'spark' >> bashline
    while read line
    do
            IFS=':' #setting space as delimiter
            read -ra ADDR <<< "$line" #reading str as an array as tokens separated by IFS
            for i in "${ADDR[@]}"; #accessing each element of array
            do
                    echo "$i"
            done >>abc
            # echo $line
    done < bashline

    x="hadoop"
    sed  -i "/\<$x\>/ d"  /home/$usar1/abc
    x="spark"
    sed  -i "/\<$x\>/ d"  /home/$usar1/abc
    uniq abc txl
    #awk '!visited[$0]++' /home/$usar1/txt >> tnt
    
    #(readarray -t ARRAY < txt; echo "${ARRAY[*]}") >> ab
    sed 'N;s/\n/\:/' < txl > ab
    #sudo rm -rf abc
    
    while read line
    do
    echo "$line"  >> ~/.bashrc
    done < ab
    
    cd /usr/local/
    sudo rm -rf tnt
    sudo rm -rf ab
    sudo rm -rf txl
    sudo rm -rf bashline
    sudo rm -rf abc
    sudo rm -rf kbc
    cd /home/$usar1/
    sudo rm -rf tnt
    sudo rm -rf ab
    sudo rm -rf txl
    sudo rm -rf bashline
    sudo rm -rf abc
    
    sed -i '/\<PATH\>/ { /\<hadoop\>/ d; }' /home/$usar1/.bashrc
    #sed -i '/\<PATH\>/ { /\<spark\>/ d; }' /home/$usar1/.bashrc
    cd /usr/local/kockpit-tools
    sudo rm -rf hadoop_store
    sudo rm -rf SSH
    sudo rm -rf Patch
    echo " "
    printf "${THUMBS_UP}"
    echo "Hadoop Removed Successfully." 
    echo " "
else
    echo " "
    printf "${THUMBS_UP}"
    echo "Removing Hadoop Skipped." 
    echo " "
fi

####################################################### Removing SPARK ###############################################

cd /usr/local/
KockpitSpark=`jq '.KOCKPITspark' KockpitInfo.json`
sudo touch /usr/local/RP/KS.txt
sudo chmod 777 /usr/local/RP/KS.txt
echo $KockpitSpark | sed "s/['\"]//g" > /usr/local/RP/KS.txt
KS=`awk 'FNR ==1 {print $1}' /usr/local/RP/KS.txt`
THUMBS_UP='\U1F44D'
if [[ $KS == *yes* ]] 
then
    echo " "
    read -t 2 -p "<<<<<Removing Old Version of Spark>>>>>" 
    echo " "
    sudo touch spark.txt
    sudo chmod 777 spark.txt
    echo $SPARK_HOME > spark.txt
    remove=`awk 'FNR ==1 {print $1}' /usr/local/spark.txt`
    #echo $remove
    sudo rm -rf $remove
    sudo rm -rf spark.txt
    sed -i '/PYSPARK_PYTHON/d' /home/$usar1/.bashrc
    sed -i '/PYSPARK_DRIVER_PYTHON/d' /home/$usar1/.bashrc
    sed -i '/SPARK_HOME/d' /home/$usar1/.bashrc
    
    cd /home/$usar1/
    
    grep 'PATH' /home/$usar1/.bashrc | grep 'hadoop' >> bashline
    grep 'PATH' /home/$usar1/.bashrc | grep 'spark' >> bashline
    while read line
    do
            IFS=':' #setting space as delimiter
            read -ra ADDR <<< "$line" #reading str as an array as tokens separated by IFS
            for i in "${ADDR[@]}"; #accessing each element of array
            do
                    echo "$i"
            done >>abc
            # echo $line
    done < bashline

    x="hadoop"
    sed  -i "/\<$x\>/ d"  /home/$usar1/abc
    x="spark"
    sed  -i "/\<$x\>/ d"  /home/$usar1/abc
    uniq abc txl
    #awk '!visited[$0]++' /home/$usar1/txt >> tnt
    
    #(readarray -t ARRAY < txt; echo "${ARRAY[*]}") >> ab
    sed 'N;s/\n/\:/' < txl > ab
    #sudo rm -rf abc
    
    while read line
    do
    echo "$line"  >> ~/.bashrc
    done < ab
    
    cd /usr/local/
    sudo rm -rf tnt
    sudo rm -rf ab
    sudo rm -rf txl
    sudo rm -rf bashline
    sudo rm -rf abc
    sudo rm -rf kbc
    cd /home/$usar1/
    sudo rm -rf tnt
    sudo rm -rf ab
    sudo rm -rf txl
    sudo rm -rf bashline
    sudo rm -rf abc
    
    #sed -i '/\<PATH\>/ { /\<hadoop\>/ d; }' /home/$usar1/.bashrc
    sed -i '/\<PATH\>/ { /\<spark\>/ d; }' /home/$usar1/.bashrc
    cd /usr/local/kockpit-tools/
    sudo rm -rf Patch
    echo " "
    printf "${THUMBS_UP}"
    echo "Spark Removed Successfully." 
    echo " "
else
    echo " "
    printf "${THUMBS_UP}"
    echo "Removing Spark Skipped"
    echo " "
fi

####################################################### Removing HIVE ###############################################

cd /usr/local/
KockpitHive=`jq '.KOCKPIThive' KockpitInfo.json`
sudo touch /usr/local/RP/KH.txt
sudo chmod 777 /usr/local/RP/KH.txt
echo $KockpitHive | sed "s/['\"]//g" > /usr/local/RP/KH.txt
KH=`awk 'FNR ==1 {print $1}' /usr/local/RP/KH.txt`
THUMBS_UP='\U1F44D'
if [[ $KH == *yes* ]] 
then
    echo " "
    read -t 2 -p "<<<<<Removing Old Version of Hive>>>>>" 
    echo " "
    sudo touch hive.txt
    sudo rm -rf Patch
    sudo chmod 777 hive.txt
    echo $HIVE_HOME > hive.txt
    remove=`awk 'FNR ==1 {print $1}' /usr/local/hive.txt`
    #echo $remove
    sudo rm -rf $remove
    sudo rm -rf hive.txt
    sed -i '/HIVE_HOME/d' /home/$usar1/.bashrc
    cd /home/$usar1/
    sudo rm -rf derby.log metastore_db
    cd /usr/local/kockpit-tools/
    sudo rm -rf Patch
    echo " "
    printf "${THUMBS_UP}"
    echo "Hive Removed Successfully."
    echo " "
else
    echo " "
    printf "${THUMBS_UP}"
    echo "Removing Hive Skipped."
    echo " "
fi

####################################################### Removing Airflow ###############################################

cd /usr/local/
KockpitAirflow=`jq '.KOCKPITairflow' KockpitInfo.json`
sudo touch /usr/local/RP/KA.txt
sudo chmod 777 /usr/local/RP/KA.txt
echo $KockpitAirflow | sed "s/['\"]//g" > /usr/local/RP/KA.txt
KA=`awk 'FNR ==1 {print $1}' /usr/local/RP/KA.txt`
THUMBS_UP='\U1F44D'
if [[ $KA == *yes* ]] 
then
    echo " "
    read -t 2 -p "<<<<<Removing Old Version of Airflow>>>>>" 
    echo " "
    yes | sudo pip3 uninstall apache-airflow
    cd /usr/local/kockpit-tools
    sudo rm -rf env_airflow
    cd /home/$usar1/
    sudo rm -rf airflow
    echo " "
    printf "${THUMBS_UP}"
    echo "Airflow Removed Successfully."
    echo " "
else
    echo " "
    printf "${THUMBS_UP}"
    echo "Removing Airflow Skipped."
    echo " "
fi

####################################################### Removing Postgres ###############################################

cd /usr/local/
KockpitPostgres=`jq '.KOCKPITpostgres' KockpitInfo.json`
sudo touch /usr/local/RP/KP.txt
sudo chmod 777 /usr/local/RP/KP.txt
echo $KockpitPostgres | sed "s/['\"]//g" > /usr/local/RP/KP.txt
KP=`awk 'FNR ==1 {print $1}' /usr/local/RP/KP.txt`
THUMBS_UP='\U1F44D'
if [[ $KP == *yes* ]] 
then
    echo " "
    read -t 2 -p "<<<<<Removing Old Version of Postgres>>>>>" 
    echo " "
    yes | sudo apt-get --purge remove postgresql postgresql-*
    cd /usr/local/kockpit-tools/
    sudo rm -rf Postgres
    echo " "
    printf "${THUMBS_UP}"
    echo "Postgres Removed Successfully."
    echo " "
else
    echo " "
    printf "${THUMBS_UP}"
    echo "Removing Postgres Skipped."
    echo " "
fi

####################################################### Removing MySQL ###############################################

cd /usr/local/
KockpitMysql=`jq '.KOCKPITmysql' KockpitInfo.json`
sudo touch /usr/local/RP/KMY.txt
sudo chmod 777 /usr/local/RP/KMY.txt
echo $KockpitMysql | sed "s/['\"]//g" > /usr/local/RP/KMY.txt
KMY=`awk 'FNR ==1 {print $1}' /usr/local/RP/KMY.txt`
THUMBS_UP='\U1F44D'
if [[ $KMY == *yes* ]] 
then
    echo " "
    read -t 2 -p "<<<<<Removing Old Version of Mysql>>>>>" 
    echo " "
    sudo apt --yes remove --purge mysql-server
    sudo apt --yes purge mysql-server
    sudo apt --yes autoremove
    sudo apt --yes autoclean
    cd /usr/local/kockpit-tools/
    sudo rm -rf MYSQL
    echo " "
    printf "${THUMBS_UP}"
    echo "Mysql Removed Successfully."
    echo " "
else
    echo " "
    printf "${THUMBS_UP}"
    echo "Removing Mysql Skipped."
    echo " "
fi

####################################################### Removing Mongo ###############################################

cd /usr/local/
KockpitMongo=`jq '.KOCKPITmongodb' KockpitInfo.json`
sudo touch /usr/local/RP/KMDB.txt
sudo chmod 777 /usr/local/RP/KMDB.txt
echo $KockpitMongo | sed "s/['\"]//g" > /usr/local/RP/KMDB.txt
KMDB=`awk 'FNR ==1 {print $1}' /usr/local/RP/KMDB.txt`
THUMBS_UP='\U1F44D'
if [[ $KMDB == *yes* ]] 
then
    echo " "
    read -t 2 -p "<<<<<Removing Old Version of MongoDB>>>>>" 
    echo " "
    yes | sudo apt purge mongo*
    sudo rm -r /var/log/mongodb
    sudo rm -r /var/lib/mongodb
    cd /usr/local/kockpit-tools/
    sudo rm -rf MongoDB
    echo " "
    printf "${THUMBS_UP}"
    echo "MongoDB Removed Successfully."
    echo " "
else
    echo " "
    printf "${THUMBS_UP}"
    echo "Removing MongoDB Skipped."
    echo " "
fi

####################################################### Removing MSSQL ###############################################

cd /usr/local/
KockpitMssql=`jq '.KOCKPITmssql' KockpitInfo.json`
sudo touch /usr/local/RP/KMSQL.txt
sudo chmod 777 /usr/local/RP/KMSQL.txt
echo $KockpitMssql | sed "s/['\"]//g" > /usr/local/RP/KMSQL.txt
KMSQL=`awk 'FNR ==1 {print $1}' /usr/local/RP/KMSQL.txt`
THUMBS_UP='\U1F44D'
if [[ $KMSQL == *yes* ]] 
then
    echo " "
    read -t 2 -p "<<<<<Removing Old Version of MSSQL>>>>>" 
    echo " "
    sudo apt --yes remove mssql-server
    sudo rm -rf /var/opt/mssql/
    sed -i '/mssql-tools/d' /home/$usar1/.bashrc
    cd /usr/local/kockpit-tools/
    sudo rm -rf MSSQL
    echo " "
    printf "${THUMBS_UP}"
    echo "MSSQL Removed Successfully."
    echo " "
else
    echo " "
    printf "${THUMBS_UP}"
    echo "Removing MSSQL Skipped."
    echo " "
fi
sudo rm -rf usar1.txt
