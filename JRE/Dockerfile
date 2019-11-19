FROM openjdk:8-jdk
# MAINTAINER August Icekimo <august.icekimo@gmail.com>

ARG J_URL=jenkins.icekimo.idv.tw
ARG SECRET=12baa94ce940afa92d2623dc35becc30d8dfd99539f4a3586a5f634af7a77345
ARG user=jenkins
ARG group=jenkins
ARG uid=1000
ARG gid=1000

RUN groupadd -g ${gid} ${group}
RUN useradd -c "Jenkins user" -d /home/${user} -u ${uid} -g ${gid} -m ${user}

ARG AGENT_WORKDIR=/home/${user}/agent

RUN echo 'deb http://deb.debian.org/debian stretch-backports main' > /etc/apt/sources.list.d/stretch-backports.list
RUN apt-get update && apt-get install -t stretch-backports git-lfs
RUN curl --create-dirs -fsSLo /usr/share/jenkins/agent.jar https://${J_URL}/jnlpJars/agent.jar \
  && chmod 755 /usr/share/jenkins \
  && chmod 644 /usr/share/jenkins/agent.jar \
  && ln -sf /usr/share/jenkins/agent.jar /usr/share/jenkins/slave.jar

USER ${user}
ENV AGENT_WORKDIR=${AGENT_WORKDIR}
RUN mkdir /home/${user}/.jenkins && mkdir -p ${AGENT_WORKDIR}

VOLUME /home/${user}/.jenkins
VOLUME ${AGENT_WORKDIR}
WORKDIR /home/${user}
ARG NODE_NAME=Kelly
CMD java -jar agent.jar -jnlpUrl https://${J_URL}/computer/${NODE_NAME}/slave-agent.jnlp -secret ${SECRET} -workDir "${AGENT_WORKDIR}"
