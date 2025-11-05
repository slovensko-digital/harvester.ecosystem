source 'https://rubygems.org'

ruby '3.4.7'

gem 'rails', '~> 8.1.1'

gem 'pg', '~> 1.1'

gem 'puma'
gem 'foreman'

gem 'clockwork'
gem 'dotenv'
gem 'sidekiq', '~> 8.0.3' # Unlock when we migrate to Redis 4+
gem 'faraday'

gem 'rubyzip'

gem 'newrelic_rpm'
gem 'rollbar'

group :development, :test do
  gem 'factory_bot_rails'
  gem 'pry'
  gem 'pry-rails'
  gem 'rspec-rails'
end

group :test do
  # Workaround for cc-test-reporter with SimpleCov 0.18.
  # Stop upgrading SimpleCov until the following issue will be resolved.
  # https://github.com/codeclimate/test-reporter/issues/418
  gem 'simplecov', '~> 0.10', '< 0.18'
  gem 'webmock'
end

gem "csv", "~> 3.3"
