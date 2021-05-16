#!/bin/bash

# Script generates cert/key needed for a vhost

[[ -z $1 ]] && { echo "\nUsage: $0 [domain-name] [days-valid]"; exit; }
[[ -z $2 ]] && days=730 || days=$2

domain=$1

mkdir $domain

openssl req -newkey rsa:4096 -days $days -nodes -x509 \
  -subj "/C=/ST=/L=/O=/OU=/CN=${domain}" \
  -extensions SAN \
  -config <(cat /etc/ssl/openssl.cnf \
          <(printf "[SAN]\nsubjectAltName='DNS:${domain}'")) \
  -keyout "${domain}/key.pem" -out "${domain}/cert.pem"


openssl rsa -inform pem -in "${domain}/key.pem" -outform der -out "${domain}/key.der"
openssl x509 -inform pem -in "${domain}/cert.pem" -outform der -out "${domain}/cert.der"