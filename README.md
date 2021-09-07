# Simple Content Calendar

## System dependencies

* ruby 2.7.3, bundler
* postgresql
* node, yarn

## Setup

Run `./bin/setup` to setup the local environment. This will create a default admin account.

## Running

Run `rails s` to run the application after setup.

## How to run the test suite

The test suite can be run using `rspec`.

## System Architecture

A user can have many social_networks. In the future, this will store the credentials etc to allow for automatic publishing. A user can also create many content_items. Each content_item can have relationships to social_networks, which is the publishing_target model. This join record is what is used to allow publishing on multiple platforms.
