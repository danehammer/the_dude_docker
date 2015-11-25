FROM ubuntu:14.04
MAINTAINER Dane Hammer, dane.molotok@gmail.com

ENV BOTDIR /opt/bot

RUN apt-get update && \
  apt-get install -y wget && \
  wget -q -O - https://deb.nodesource.com/setup | sudo bash - && \
  apt-get install -y git build-essential nodejs && \
  rm -rf /var/lib/apt/lists/*

# increment this each time you want to force a rebuild of the following layers
ENV cache_invalidating_dummy 1000000003

RUN git clone --depth=1 https://github.com/danehammer/the_dude_hubot.git ${BOTDIR}

WORKDIR ${BOTDIR}

RUN npm install

ENV HUBOT_PORT 8080
ENV HUBOT_ADAPTER slack
ENV HUBOT_NAME the_dude
ENV HUBOT_SLACK_TEAM tquest
ENV HUBOT_SLACK_BOTNAME ${HUBOT_NAME}
ENV PORT ${HUBOT_PORT}

EXPOSE ${HUBOT_PORT}

WORKDIR /opt/bot

CMD bin/hubot
