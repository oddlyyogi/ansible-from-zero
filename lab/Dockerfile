FROM debian:trixie-slim
RUN apt-get update && apt-get install -y --no-install-recommends \
    systemd systemd-sysv openssh-server sudo python3 \
 && rm -rf /var/lib/apt/lists/*
RUN systemctl mask getty@tty1.service systemd-modules-load.service \
 && useradd --create-home --shell /bin/bash ansible \
 && echo 'ansible ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/ansible
COPY --chown=ansible:ansible authorized_keys /home/ansible/.ssh/authorized_keys
RUN chmod 700 /home/ansible/.ssh && chmod 600 /home/ansible/.ssh/authorized_keys
CMD ["/sbin/init"]