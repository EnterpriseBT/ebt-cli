FROM ubuntu:latest

# Install bash, git, and bash-completion for autocompletion
RUN apt-get update && \
    apt-get install -y bash git bash-completion && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set bash as the default shell
SHELL ["/bin/bash", "-c"]

# Set working directory
WORKDIR /workspace

# Copy CLI scripts and config
COPY scripts/ /usr/local/bin/ebt-cli-scripts/
COPY config.sh /tmp/config.sh

# Run configuration script
RUN chmod +x /tmp/config.sh && \
    /tmp/config.sh && \
    rm /tmp/config.sh

