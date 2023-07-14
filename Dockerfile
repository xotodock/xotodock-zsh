# Setup Stage - set up the ZSH environment for optimal developer experience
FROM alpine:latest AS setup
# Let scripts know we're running in Docker (useful for containerised development)
ENV RUNNING_IN_DOCKER true
# Use the unprivileged `main` user (created without a password ith `-D`) for safety
RUN adduser -D main
RUN mkdir -p /app \
    && chown -R main:main /app
# Set up ZSH and our preferred terminal environment for containers
RUN apk --no-cache add zsh curl git
RUN mkdir -p /home/main/.antigen
RUN curl -L git.io/antigen > /home/main/.antigen/antigen.zsh
# Use my starter Docker ZSH config file for this, or your own ZSH configuration file (https://gist.github.com/arctic-hen7/bbfcc3021f7592d2013ee70470fee60b)
# COPY .dockershell.sh /home/main/.zshrc
RUN chown -R main:main /home/main/.antigen /home/main/.zshrc
# Set up ZSH as the unprivileged user (we just need to start it, it'll initialise our setup itself)
USER main
# RUN /bin/zsh /home/main/.zshrc
# Switch back to root for whatever else we're doing
USER root
