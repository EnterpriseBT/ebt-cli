FROM ubuntu:latest

# Install bash and git
RUN apt-get update && \
    apt-get install -y bash git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set bash as the default shell
SHELL ["/bin/bash", "-c"]

# Set working directory
WORKDIR /workspace

