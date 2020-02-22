FROM alpine:3.11

ENV SSH_PASSWD "root:Docker!"

RUN apk add openssh && echo "$SSH_PASSWD" | chpasswd

COPY sshd_config /etc/ssh/

RUN mkdir -p /tmp
COPY ssh_setup.sh /tmp
RUN chmod -R +x /tmp/ssh_setup.sh \
   && (sleep 1;/tmp/ssh_setup.sh 2>&1 > /dev/null) \
   && rm -rf /tmp/*
 
EXPOSE 2222

CMD ["/usr/sbin/sshd", "-D", "-e", "-f", "/etc/ssh/sshd_config"]

