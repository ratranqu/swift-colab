FROM jupyter/base-notebook

# Fix DL4006
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

USER root
#Install Cron
RUN apt-get update
RUN apt-get -y install bash curl git

COPY . .

RUN chmod +rwx install_swift.sh
RUN ./install_swift.sh "5.6.2"