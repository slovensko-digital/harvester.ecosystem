source 'https://rubygems.org'

ruby '2.6.6'

gem 'rails', '~> 6.0.3.2'

gem 'pg', '~> 0.20'
gem 'jbuilder', '~> 2.6'

gem 'dotenv'
gem 'typhoeus'
gem 'clockwork'
gem 'sidekiq'
gem 'foreman'
gem 'puma'
gem 'newrelic_rpm'
gem 'rollbar'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
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

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
