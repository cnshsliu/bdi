#!/bin/bash

if [ "$(tail -1 ~/.bashrc)" != "export PATH=\$PATH:~/bdi/bin/" ]; then
  echo "export PATH=\$PATH:~/bdi/bin/" >> ~/.bashrc
  source ~/.bashrc
fi
chmod +x ~/bdi/bin/*

printf "Checking container data volumes..."
mkdir -p ~/bigdatavault/hadoop/dfs/name
mkdir -p ~/bigdatavault/hadoop/dfs/data
mkdir -p ~/bigdatavault/zeppelin/logs
mkdir -p ~/bigdatavault/zeppelin/data
mkdir -p ~/bigdatavault/zeppelin/notebook
mkdir -p ~/bigdatavault/mysql/data
mkdir -p ~/bigdatavault/mdata
mkdir -p ~/bigdatavault/rdata
printf "Done.\n"

if [ ! -d ~/bdi/resources ]; then
  printf "Prepare bdi/resources..."
  mkdir -p ~/bdi/resources
  # 虽然通过VirtualBox Share Folder做了映射，但进入到container中
  # 不能访问这个映射目录，所以，要全量拷贝
  cp ~/host_resources/* ~/bdi/resources/
  printf "Done.\n"
fi

if [ -d ~/myBdApp ]; then
   if [ ! -f ~/myBdApp/resources/hadoop-3.2.1.tar.gz ]; then
      printf "Prepare myBdApp resources..."
      mkdir -p ~/myBdApp/resources/
      cp ~/host_resources/hadoop-3.2.1.tar.gz ~/myBdApp/resources
      cp ~/host_resources/sbt-1.4.5.tgz ~/myBdApp/resources
      printf "Done.\n"
   fi
else
  printf "Download myBdApp..."
  cd
  git clone git@github.com:cnshsliu/myBdApp.git
  printf "Done.\n"
  printf "Prepare myBdApp resources..."
  mkdir ~/myBdApp/resources
  cp ~/host_resources/hadoop-3.2.1.tar.gz ~/myBdApp/resources
  cp ~/host_resources/sbt-1.4.5.tgz ~/myBdApp/resources
  printf "Done.\n"
fi

if [ -d ~/lucas_zeppelin ]; then
   if [ ! -f ~/lucas_zeppelin/resources/spark-3.0.1-bin-hadoop3.2.tgz ]; then
      printf "Prepare lucas_zeppelin resources..."
      mkdir -p ~/lucas_zeppelin/resources/
      cp ~/host_resources/spark-3.0.1-bin-hadoop3.2.tgz  ~/lucas_zeppelin/resources
      printf "Done.\n"
   fi
else
  printf "Download lucas_zeppelin..."
  cd
  git clone https://github.com/cnshsliu/lucas_zeppelin.git
  printf "Done.\n"
  printf "Prepare lucas_zeppelin resources..."
  mkdir ~/lucas_zeppelin/resources
  cp ~/host_resources/spark-3.0.1-bin-hadoop3.2.tgz  ~/lucas_zeppelin/resources
  printf "Done.\n"
fi
