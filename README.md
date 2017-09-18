# Harvester

Harvester is an open-source application that downloads data from various public sources and pushes data to [ekosystem.slovensko.digital](https://ekosystem.slovensko.digital/). 

[![CircleCI](https://circleci.com/gh/slovensko-digital/harvester.ecosystem.svg?style=shield&circle-token=4ceebb8c3fa816ecc9ab67491f55f665ea9d8661)](https://circleci.com/gh/slovensko-digital/harvester.ecosystem)
[![Dependency Status](https://gemnasium.com/slovensko-digital/harvester.ecosystem.png)](https://gemnasium.com/slovensko-digital/harvester.ecosystem)
[![Code Climate](https://codeclimate.com/github/slovensko-digital/harvester.ecosystem.png)](https://codeclimate.com/github/slovensko-digital/harvester.ecosystem)
[![Test Coverage](https://codeclimate.com/github/slovensko-digital/harvester.ecosystem/badges/coverage.svg)](https://codeclimate.com/github/slovensko-digital/harvester.ecosystem/coverage)
[![Inch CI](https://inch-ci.org/github/slovensko-digital/harvester.ecosystem.svg)](https://inch-ci.org/github/slovensko-digital/harvester.ecosystem)

## Development  

Harvester is a Ruby-on-Rails application. However, there is no web process present. The application
runs as a backend worker/scheduler and uses the Rails framework to enforce coding rules for the project. 

To get the Harvester dependencies running (db, etc), 
we have prepared a [Docker Compose](https://docs.docker.com/compose/) file for you. 
You can start the dependencies with `docker-compose up`.

To run and test the application while developing:

- Prepare the environment with `bin/setup`
- Ensure that all tests pass: `rake spec`
- Start the worker with `foreman start worker` 
- Run a selected job with rake
- Check that the corresponding database tables have been filled in

## Contributing

Feel free to contribute other datasets / scrapers or improvements. See [issues](https://github.com/slovensko-digital/ekosystem/issues) if you want to help, request a feature or file a bug. Join us on our [public slack channel](http://slack.slovensko.digital/) if you want to talk live.
