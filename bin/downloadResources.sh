#!/bin/bash

targetDIR=~/bdi/resources
mkdir -p  $targetDIR
wget http://$1:$2/apt.deb -O $targetDIR/apt.deb
wget http://$1:$2/bank.zip -O $targetDIR/bank.zip
wget http://$1:$2/donation.zip -O $targetDIR/donation.zip
wget http://$1:$2/hadoop-3.2.1.tar.gz -O $targetDIR/hadoop-3.2.1.tar.gz
wget http://$1:$2/index.html -O $targetDIR/index.html
wget http://$1:$2/kudu-spark3_2.12-1.13.0.7.1.5.2-1.jar -O $targetDIR/kudu-spark3_2.12-1.13.0.7.1.5.2-1.jar
wget http://$1:$2/mysql-connector-java-8.0.22.jar -O $targetDIR/mysql-connector-java-8.0.22.jar
wget http://$1:$2/sbt-1.4.5.tgz -O $targetDIR/sbt-1.4.5.tgz
wget http://$1:$2/spark-3.0.1-bin-hadoop3.2.tgz -O $targetDIR/spark-3.0.1-bin-hadoop3.2.tgz
