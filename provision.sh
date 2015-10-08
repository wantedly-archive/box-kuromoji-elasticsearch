#!/bin/bash

ELASTICSEARCH_VERSION=1.5.2
KUROMOJI_VERSION=2.5.0

sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get install -y openjdk-7-jre
sudo update-alternatives --set java $(update-alternatives --list java | grep java-7)
sudo wget -O /tmp/elasticsearch-$ELASTICSEARCH_VERSION.deb https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-$ELASTICSEARCH_VERSION.deb
sudo dpkg -i /tmp/elasticsearch-$ELASTICSEARCH_VERSION.deb
sudo sed -i 's/#http.enabled: false/http.enabled: true/g' /etc/elasticsearch/elasticsearch.yml
sudo sed -i 's/#network.host: 192.168.0.1/network.host: 0.0.0.0/g' /etc/elasticsearch/elasticsearch.yml
sudo bash -c 'echo script.disable_dynamic: false >> /etc/elasticsearch/elasticsearch.yml'
sudo /usr/share/elasticsearch/bin/plugin -install elasticsearch/elasticsearch-analysis-kuromoji/$KUROMOJI_VERSION
sudo service elasticsearch restart
