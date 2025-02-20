# otel-vector-vs-fluentbit
Benchmark for OTel Vector vs fluentbit files

docker-compose -f docker-compose-fluentbit.yaml up -d && ./monitor.sh fluentbit
# stop all containers after test finishes
docker-compose -f docker-compose-fluentbit.yaml down && ./init.sh


docker-compose -f docker-compose-vector.yaml up -d && ./monitor.sh vector
# stop all containers after test finishes
docker-compose -f docker-compose-vector.yaml down && ./init.sh


docker run \
  -d \
  -e VECTOR_LOG=DEBUG \
  -v $PWD/vector/vector.yaml:/etc/vector/vector.yaml:ro \
  -p 8686:8686 \
  -p 50052:50052 \
  -p 50051:50051 \
  --name vector \
  timberio/vector:0.44.0-debian


docker run \
  -d \
  -v $PWD/vector/vector.yaml:/etc/vector/vector.yaml:ro \
  --name vector \
  timberio/vector:0.44.0-debian  