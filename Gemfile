source 'https://rubygems.org'

ruby '2.6.6'

gem 'rails', '~> 6.0.3.2'

gem 'pg', '~> 0.20'

gem 'puma'
gem 'foreman'

gem 'dotenv'
gem 'typhoeus'
gem 'clockwork'
gem 'sidekiq'

gem 'newrelic_rpm'
gem 'rollbar'

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'pry'
end

group :test do
  # Workaround for cc-test-reporter with SimpleCov 0.18.
  # Stop upgrading SimpleCov until the following issue will be resolved.
  # https://github.com/codeclimate/test-reporter/issues/418
  gem 'simplecov', '~> 0.10', '< 0.18'
  gem 'webmock'
end
