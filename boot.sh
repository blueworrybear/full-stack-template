#!/usr/bin/env sh
envsubst < /etc/traefik/provider.template.toml | tee /etc/traefik/provider.toml
envsubst < /etc/traefik/traefik.template.toml | tee /etc/traefik/traefik.toml
traefik --log=true&
cd /share/web
./app web &
python main.py
