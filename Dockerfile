FROM ruby:2.4.1

RUN apt-get update && apt-get install postgresql postgresql-contrib -y