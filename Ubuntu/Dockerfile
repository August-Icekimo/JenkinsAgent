FROM ubuntu:18.04
# MAINTAINER Icekimo august.icekimo@gmail.com

LABEL description="Create a Jenkins Agent to build others"
ARG J_URL=jenkins.icekimo.idv.tw
ARG SECRET=12baa94ce940afa92d2623dc35becc30d8dfd99539f4a3586a5f634af7a77345
ARG user=jenkins
ARG group=jenkins
ARG uid=1000
ARG gid=1000

# Install Build Packages
RUN apt-get update &&\
    apt-get install -y sudo time git-core subversion build-essential gcc-multilib quilt rsync \
                        libncurses5-dev zlib1g-dev gawk flex gettext wget unzip python default-jdk \
                        git-lfs vim  &&\
    apt-get clean
# Add an user named jenkins
RUN  useradd -c "Jenkins user" -d /home/${user} -u ${uid} -m ${user} &&\
    echo '${user} ALL=NOPASSWD: ALL' > /etc/sudoers.d/${user}
    
# USER jenkins
ARG AGENT_WORKDIR=/home/${user}/agent

#RUN echo 'deb http://deb.debian.org/debian stretch-backports main' > /etc/apt/sources.list.d/stretch-backports.list
#RUN apt-get update && apt-get install -t stretch-backports git-lfs
RUN mkdir -p /usr/share/jenkins && wget https://${J_URL}/jnlpJars/agent.jar -O /usr/share/jenkins/agent.jar
RUN chmod 755 /usr/share/jenkins \
  && chmod 644 /usr/share/jenkins/agent.jar \
  && ln -sf /usr/share/jenkins/agent.jar /usr/share/jenkins/slave.jar

USER ${user}
ENV AGENT_WORKDIR=${AGENT_WORKDIR}
RUN mkdir /home/${user}/.jenkins && mkdir -p ${AGENT_WORKDIR}

VOLUME /home/${user}/.jenkins
VOLUME ${AGENT_WORKDIR}
WORKDIR /home/${user}
ARG NODE_NAME=Kelly
#CMD java -jar agent.jar -jnlpUrl https://${J_URL}/computer/${NODE_NAME}/slave-agent.jnlp -secret ${SECRET} -workDir "${AGENT_WORKDIR}"
