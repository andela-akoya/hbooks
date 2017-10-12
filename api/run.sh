#!/bin/bash

echo "Installing gem dependencies"
bundle install

echo "Initializing database"
rails db:setup

echo "Starting up server"
rails server