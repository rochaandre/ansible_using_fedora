FROM fedora:41

RUN yum -y install gcc python3.9 && \
    yum -y install python3-pip && \
    yum -y install plocate && \    
    yum -y install openssh-clients && \
    yum -y install net-tools   && \ 
    yum -y install python3-PyYAML && \
    yum -y install iputils && \
    yum -y install sshpass && \
    yum -y clean all 

RUN pip3 install ansible-core==2.18.2

RUN updatedb
RUN mkdir /ansible && \
    mkdir -p /stage/scripts && \
    mkdir -p /etc/ansible && \
    echo 'localhost' > /etc/ansible/hosts && \
    echo 'export ANSIBLE_CONFIG=/ansible/ansible.conf' >> /root/.bash_profile && \
    echo 'export ANSIBLE_CONFIG=/ansible/ansible.conf' >> /root/.bash_profile && \
    echo 'echo "################################################"' >> /root/.bash_profile && \
    echo 'echo "## ANSIBLE EXECUTING .bash_profile "' >> /root/.bash_profile && \
    echo 'echo "################################################"' >> /root/.bash_profile && \
    echo "PS1='\[\e[32m\][$LOGNAME@\h:$PWD ]\[\e[0m\] \W\n\$ ' " >> /root/.bash_profile

COPY sshUserSetup.sh /stage/scripts
#ADD /docker/oracle/sshUserSetup.sh /stage/scripts/

WORKDIR /ansible

CMD [ "ansible-playbook", "--version" ]