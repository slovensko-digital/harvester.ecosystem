# Harvester

[![Slovensko.Digital CI](https://github.com/slovensko-digital/harvester.ecosystem/workflows/Slovensko.Digital%20CI/badge.svg)](https://github.com/slovensko-digital/harvester.ecosystem/actions/workflows/slovensko_digital_ci.yml)
[![Maintainability](https://api.codeclimate.com/v1/badges/659f7d03994b8ae099cc/maintainability)](https://codeclimate.com/github/slovensko-digital/harvester.ecosystem)
[![Test Coverage](https://api.codeclimate.com/v1/badges/659f7d03994b8ae099cc/test_coverage)](https://codeclimate.com/github/slovensko-digital/harvester.ecosystem)

Harvester is an open-source application that downloads data from various public sources and pushes data to [ekosystem.slovensko.digital](https://ekosystem.slovensko.digital/). 

## Supported data sources

Currently, Harvester supports the following data-sources:

- [ITMS2014+](https://www.itms2014.sk/) 
- [Institutions with public e-desk](https://data.gov.sk/dataset/upvs-institucie-so-schrankou)

Currently, there are data sources in [ekosystem.slovensko.digital](https://ekosystem.slovensko.digital/)
which are not ingested by Harvester. The corresponding code hasn't been open-sourced yet.
 

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
