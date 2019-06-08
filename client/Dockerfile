FROM centos:7
RUN yum install -y sudo && \
    useradd vagrant -m && \
    usermod -aG wheel vagrant && \
    echo "%vagrant ALL=(ALL)       NOPASSWD: ALL" > /etc/sudoers.d/vagrant && \
    chmod 640 /etc/sudoers.d/vagrant && \
    yum install -y git
COPY prompt.sh /tmp/prompt.sh
RUN chmod +x /tmp/prompt.sh && \
    /tmp/prompt.sh
USER vagrant
WORKDIR /home/vagrant