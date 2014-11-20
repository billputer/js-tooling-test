#!/bin/bash

set -e

echo
echo "Installing Neo4j..."

# add neo4j repo
wget -s -O - http://debian.neo4j.org/neotechnology.gpg.key | apt-key add -
echo 'deb http://debian.neo4j.org/repo stable/' > /etc/apt/sources.list.d/neo4j.list

# upd
apt-get update -qq
apt-get install neo4j -y

echo
echo "Updating Neo4j Config..."
sed -i 's/#org\.neo4j\.server\.webserver\.address=0\.0\.0\.0/org.neo4j.server.webserver.address=0.0.0.0/' /etc/neo4j/neo4j-server.properties
service neo4j-service restart
