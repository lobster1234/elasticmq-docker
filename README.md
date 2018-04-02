## Dockerized ElasticMQ for ECS

This is a quick dockerization of [ElasticMQ](https://github.com/adamw/elasticmq) so I could run it in ECS as a service. I've used alpine OpenJDK8 JRE.

## Usage 

```
$ git clone git@github.com:lobster1234/elasticmq-docker.git
$ cd elasticmq-docker
$ docker build .
$ docker run -p9324:9324 <image_id>

```
## ECS

The repository contains a `task_definition.json`. As you can see, I've used `256MB` and `128vCPU` for this task. I've also used us-east-1, and called the task as `elasticmq`. Everything else is default ECS including log driver and IAM roles, etc.

Please use this JSON as a reference as you create a task definition with this container.

Finally, you'd create a service using this task, and create 1 instance. You'd create a new listener on the ALB (preferably port `9324`) with path as `/`. Please edit the health check for the target group to check for a `404` and not `200` otherwise you'd end up getting unhealthy hosts and infinite drain and initial cycles. **This is very important.**
