#!/bin/bash
ELK=

wget -P /tmp/ https://download.elastic.co/beats/filebeat/filebeat_1.2.1_amd64.deb
sudo dpkg -i /tmp/filebeat_1.2.1_amd64.deb
curl -XPUT "http://${ELK}:9200/_template/filebeat?pretty" -d@/etc/filebeat/filebeat.template.json
sudo cat > /etc/filebeat/filebeat.yml <<EOL
filebeat:
  prospectors:
    -
      paths:
        - "/home/ubuntu/logs/*.log*"
      document_type: json_log
output:
  logstash:
    enabled: true
    hosts:
      - ${ELK}:5044
    index: filebeat
EOL
sudo /etc/init.d/filebeat restart
