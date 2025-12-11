FROM ubuntu:latest

# Install bash, git, bash-completion, and vendor CLI dependencies
RUN apt-get update && \
    apt-get install -y \
        bash \
        git \
        bash-completion \
        curl \
        unzip \
        gpg \
        apt-transport-https \
        ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set bash as the default shell
SHELL ["/bin/bash", "-c"]

# Set working directory
WORKDIR /workspace

# Copy CLI scripts and configuration files
COPY scripts/ /usr/local/bin/ebt-cli/scripts/
COPY install.sh /usr/local/bin/ebt-cli/install.sh
COPY lib/ /usr/local/bin/ebt-cli/lib/

RUN chmod +x /usr/local/bin/ebt-cli/install.sh
RUN /usr/local/bin/ebt-cli/install.sh
