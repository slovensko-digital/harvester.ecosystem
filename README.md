# Harvester

Harvester is an open-source application that downloads data from various public sources and pushes data to [ekosystem.slovensko.digital](https://ekosystem.slovensko.digital/). 

[![CircleCI](https://circleci.com/gh/slovensko-digital/harvester.ecosystem.svg?style=shield&circle-token=4ceebb8c3fa816ecc9ab67491f55f665ea9d8661)](https://circleci.com/gh/slovensko-digital/harvester.ecosystem)
[![Dependency Status](https://gemnasium.com/slovensko-digital/harvester.ecosystem.png)](https://gemnasium.com/slovensko-digital/harvester.ecosystem)
[![Code Climate](https://codeclimate.com/github/slovensko-digital/harvester.ecosystem.png)](https://codeclimate.com/github/slovensko-digital/harvester.ecosystem)
[![Test Coverage](https://codeclimate.com/github/slovensko-digital/harvester.ecosystem/badges/coverage.svg)](https://codeclimate.com/github/slovensko-digital/harvester.ecosystem/coverage)
[![Inch CI](https://inch-ci.org/github/slovensko-digital/harvester.ecosystem.svg)](https://inch-ci.org/github/slovensko-digital/harvester.ecosystem)

## Development  

Harvester is a Ruby-on-Rails application, requiring: 
- Ruby version 2.4.1 and higher
- Postgres 9.6 or higher

#### Start with Docker

The quickest way to get the application running is using [Docker](https://www.docker.com), which 
enables to get the complete environment up and running with one command. 
 
Ensure you have the Docker v17+ and Docker-Compose 1.14+ installed. 
If installed properly, the commands `docker -v` and `docker-compose -v` should give you the versions.

Then, start Harvester with `docker-compose -f docker-compose-dev.yml up`. This will:

- start the Postgres instance
- install application dependencies (gems) to `/.bundle` directory
- run database migrations
- start the server 

Running `docker-compose up` for the first time might take a few minutes in order to download 
the Postgres and Ruby Docker containers.

## Contributing

Feel free to contribute other datasets / scrapers or improvements. See [issues](https://github.com/slovensko-digital/ekosystem/issues) if you want to help, request a feature or file a bug. Join us on our [public slack channel](http://slack.slovensko.digital/) if you want to talk live.
