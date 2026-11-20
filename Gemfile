source 'https://rubygems.org'

ruby '4.0.10'

gem 'rails', '~> 8.1.4'

gem 'pg', '~> 1.1'

gem 'puma', '>= 6.0'
gem 'foreman'

gem 'clockwork'
gem 'dotenv'
# Staging Redis is 6.2; Sidekiq 8 requires Redis 7.
gem 'sidekiq', '~> 7.3.10'
gem 'faraday'
gem 'faraday-follow_redirects'

gem 'rubyzip'

gem 'rollbar'

gem 'csv'
gem 'bootsnap', require: false

group :development, :test do
  gem 'factory_bot_rails'
  gem 'pry'
  gem 'pry-rails'
  gem 'rspec-rails'
end

group :test do
  gem 'simplecov'
  gem 'webmock'
end
