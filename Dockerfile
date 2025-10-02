# Use a slim Python image as a base
FROM python:3-slim-bookworm

# Install borgmatic, borgbackup, and openssh-server
RUN apt-get update && apt-get install -y \
    borgbackup \
    openssh-server \
    && pip install borgmatic

# Create a directory for the SSH server to run
RUN mkdir /var/run/sshd

# Configure SSH to allow root login.
# WARNING: This is not recommended for production environments.
# You should use SSH keys for authentication instead.
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Set a root password.
# WARNING: You should change this to a more secure password.
RUN echo 'root:password' | chpasswd

# Expose the SSH port
EXPOSE 22

# Start the SSH server
CMD ["/usr/sbin/sshd", "-D"]

