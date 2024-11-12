#!/bin/bash

read -p "Enter username: " abc

echo "username is $abc"

sudo useradd -m $abc

echo "user is added"
