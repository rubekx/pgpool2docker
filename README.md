# pgpool2docker
## pgpool
https://github.com/bitnami/containers/tree/main/bitnami/pgpool
## debezium
https://github.com/debezium/container-images/tree/main
## kafka-ui
https://github.com/provectus/kafka-ui/tree/master
## postgres postgres-decoderbufs, based on Protocol Buffers and maintained by the Debezium community
https://github.com/debezium/container-images/tree/main/postgres/14



sudo docker exec kafka /kafka/bin/kafka-console-consumer.sh \
    --bootstrap-server localhost:9092 \
    --from-beginning \
    --property print.key=true \
    --topic dbserver1.mapper




sudo docker compose -f docker-compose.yaml exec kafka /kafka/bin/kafka-console-consumer.sh \
    --bootstrap-server kafka:9092 \
    --from-beginning \
    --property print.key=true \
    --topic dbserver1