--create topic
kafka-topics --create --topic test --bootstrap-server localhost:9092 --partitions 1 --replication-factor 1

--list kafka topics
kafka-topics --bootstrap-server=localhost:9092 --list

--start console proudcer and send messages
kafka-console-producer --topic test --bootstrap-server localhost:9092

--start console consumer and receive messages
kafka-console-consumer --topic test --from-beginning --bootstrap-server localhost:9092

kafka-console-consumer --topic source.public.tc_logs  --from-beginning --bootstrap-server localhost:9092