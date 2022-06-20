# FROM jupyter/base-notebook
FROM jupyter/base-notebook

# Fix DL4006
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

USER root
#Install Cron
RUN apt-get update
RUN apt-get -y install bash curl git libncurses5 libc6-dev libc++-dev \
               libc++abi-dev libstdc++-9-dev binutils python-dev 


ENV PYTHONPATH=/opt/conda/lib/python3.10/site-packages

COPY . .
RUN chmod +rwx install_swift.sh

RUN ./install_swift.sh "5.6.2"