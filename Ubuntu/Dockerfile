FROM ubuntu:18.04
# MAINTAINER Icekimo august.icekimo@gmail.com

LABEL description="Create a Jenkins Agent to build others"
ARG J_URL=jenkins.icekimo.idv.tw
ARG SECRET=12baa94ce940afa92d2623dc35becc30d8dfd99539f4a3586a5f634af7a77345
ARG user=jenkins
ARG group=jenkins
ARG uid=1000
ARG gid=1000
ARG AGENT_WORKDIR=/var/lib/jenkins
ARG NODE_NAME=Kelly

# Install Build Packages
RUN apt-get update && apt-get install -y \
   sudo time git-core subversion build-essential gcc-multilib quilt rsync \
   libncurses5-dev zlib1g-dev gawk flex gettext wget unzip python default-jdk \
    git-lfs vim  &&\
    apt-get clean && mkdir -p ${AGENT_WORKDIR}
# Add  jenkins as unprivileged user
 RUN  useradd -c "Jenkins user" -d /home/${user} -u ${uid} -m ${user} &&\
    echo '${user} ALL=NOPASSWD: ALL' > /etc/sudoers.d/${user}  &&\
    chown -R ${gid}:${uid} /var/lib/jenkins

USER ${user}
RUN cd /home/jenkins && wget https://${J_URL}/jnlpJars/agent.jar -O /home/jenkins/agent.jar
RUN chmod 755 /home/jenkins  && chmod 755 /home/jenkins/agent.jar

ENV AGENT_WORKDIR=${AGENT_WORKDIR}
WORKDIR /home/${user}

#VOLUME /home/${user}/.jenkins
#VOLUME ${AGENT_WORKDIR}
RUN echo "(/usr/bin/java -jar /home/agent.jar -jnlpUrl https://${J_URL}/computer/${NODE_NAME}/slave-agent.jnlp -secret ${SECRET} -workDir "${AGENT_WORKDIR}") & " > /home/jenkins/agent.sh && chmod +x /home/jenkins/agent.sh
# CMD ["-jar /usr/share/jenkins/agent.jar","-jnlpUrl https://${J_URL}/computer/${NODE_NAME}/slave-agent.jnlp","-secret ${SECRET}","-workDir ${AGENT_WORKDIR" ]
# CMD [" -jnlpUrl","https://jenkins.icekimo.idv.tw/computer/Kelly/slave-agent.jnlp", "-secret","12baa94ce940afa92d2623dc35becc30d8dfd99539f4a3586a5f634af7a77345","-workDir"," /var/lib/jenkins"]
ENTRYPOINT [ "/bin/cat", "/home/jenkins/agent.sh"]
# /usr/bin/java -jar /usr/share/jenkins/agent.jar -jnlpUrl https://jenkins.icekimo.idv.tw/computer/Kelly/slave-agent.jnlp -secret 12baa94ce940afa92d2623dc35becc30d8dfd99539f4a3586a5f634af7a77345 -workDir "/var/lib/jenkins"
#  docker run -it --name jagent jatest:latest