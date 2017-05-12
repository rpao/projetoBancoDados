# README

* Ruby version 2.3.0
        *    sudo apt-add-repository ppa:brightbox/ruby-ng
        *    sudo apt-get update
        *    sudo apt-get install ruby2.3
        *    
* Rails version 5.0.2 (can't be 5.0.1)
        *    gem install rails --version 5.0.2
* System dependencies
    * Postgresql
        *    sudo apt-get update 
        *    sudo apt-get install postgresql postgresql-contrib 

* Configuration

        bundle install

* Database creation

* Database initialization

        $ psql
        ubuntu# create database maanaim_development;
        ubuntu# \q
        $ rails db:migrate

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
