FROM ubuntu:18.04
RUN sudo apt-get update -y
RUN sudo apt-get install curl -y
RUN curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
RUN sudo apt update -y
RUN sudo apt -y install python3-pip
RUN sudo pip3 install virtualenv
RUN sudo apt -y install wget
RUN sudo apt -y install gettext
RUN sudo apt -y install nodejs
RUN sudo wget https://dl.google.com/go/go1.14.3.linux-amd64.tar.gz
RUN sudo tar -xvf go1.14.3.linux-amd64.tar.gz
RUN sudo mv go /usr/local
WORKDIR /usr/bin
RUN sudo wget https://github.com/containous/traefik/releases/download/v2.2.1/traefik_v2.2.1_linux_amd64.tar.gz
RUN sudo tar -zxvf traefik_v2.2.1_linux_amd64.tar.gz
RUN sudo rm -rf traefik_v2.2.1_darwin_amd64.tar.gz
RUN sudo mkdir -p /etc/traefik
RUN sudo mkdir -p /share/web
COPY . /share/web/
WORKDIR /share/web
RUN go build -o app main.go
RUN virtualenv venv
RUN source venv/bin/activate
RUN pip install .
ENTRYPOINT [ "/bin/bash", "/share/web/boot.sh" ]
