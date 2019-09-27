#!/usr/bin/sh

curl -H "Content-Type: application/json" -XPUT \
-d '{"template": "*","settings": {"index": {"number_of_shards": 1,"number_of_replicas": 0}}}' \
 http://localhost:9200/_template/defaults

# Or save below json in a file named template.json and run below command:
# curl -H "Content-Type: application/json" -XPUT -d @template.json http://localhost:9200/_template/defaults

#{
#  "template": "*",
#  "settings": {
#    "index": {
#      "number_of_shards": 1,
#      "number_of_replicas": 0
#    }
#  }
#}
