ARG ImgName=ubuntu:18.04
FROM ${ImgName}
LABEL MAINTAINER=august.icekimo@gmail.com
LABEL description="Create a Jenkins Agent to build others"

# Add  jenkins as unprivileged user
ARG user=jenkins
ARG group=jenkins
ARG uid=1000
ARG gid=1000
ENV user=${user}

RUN  apt update && apt install sudo wget default-jre -y && useradd -c "Jenkins user" -d /home/${user} -u ${uid} -m ${user} &&\
    echo '${user} ALL=NOPASSWD: ALL' > /etc/sudoers.d/${user}  

# Add JNLP info
ARG J_URL=jenkins.icekimo.idv.tw
ARG SECRET=12baa94ce940afa92d2623dc35becc30d8dfd99539f4a3586a5f634af7a77345
ARG AGENT_WORKDIR=/var/lib/jenkins
ARG NODE_NAME=Kelly

ENV J_URL=${J_URL}
ENV NODE_NAME=${NODE_NAME}
ENV SECRET=${SECRET}
ENV AGENT_WORKDIR=${AGENT_WORKDIR}
RUN  mkdir -p ${AGENT_WORKDIR} && chown -R ${gid}:${uid} ${AGENT_WORKDIR} 

USER ${user}
RUN cd /home/${user}&& wget --no-check-certificate https://${J_URL}/jnlpJars/agent.jar -O /home/${user}/agent.jar
RUN chmod 755 /home/${user}  && chmod 755 /home/${user}/agent.jar
WORKDIR /home/${user}

VOLUME /home/${user}/.jenkins
VOLUME ${AGENT_WORKDIR}

CMD /usr/bin/java -jar /home/${user}/agent.jar -jnlpUrl https://${J_URL}/computer/${NODE_NAME}/slave-agent.jnlp -secret ${SECRET} -workDir """${AGENT_WORKDIR}"""