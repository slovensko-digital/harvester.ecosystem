source 'https://rubygems.org'

ruby '2.7.2'

gem 'rails', '~> 6.0.3.2'

gem 'pg', '~> 0.20'

gem 'puma'
gem 'foreman'

gem 'clockwork'
gem 'dotenv'
gem 'sidekiq', '~> 5.2.9' # Unlock when we migrate to Redis 4+
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
