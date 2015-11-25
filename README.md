the_dude_docker
---------------

Image 'danehammer/the_dude' built from this Dockerfile. Requires the HUBOT_SLACK_TOKEN to be set in the environment so it can connect. This is also assumed in the docker-compose.yml.

The constraints listed in the docker-compose.yml are node names in my docker swarm, substitute accordingly.

To run this on a swarm, you need the swarm set up to use a cluster-store and cluster-advertise, and then set your DOCKER_HOST to the swarm master, then run docker-compose up.

```
export DOCKER_HOST="tcp://<ip_of_swarm_master>:<swarm_master_port>"
docker-compose --x-networking up -d
```
