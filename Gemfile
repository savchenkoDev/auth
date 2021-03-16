# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem "rake"
gem "puma"

gem 'sinatra', require: 'sinatra/base'
gem 'sinatra-contrib'

gem 'i18n'
gem 'config'

gem 'sequel'
gem 'sequel-seed', '~> 1.1', '>= 1.1.2'
gem 'sequel_secure_password'
gem 'pg'

gem 'dry-initializer'
gem 'dry-validation'

gem 'activesupport', require: false
gem 'fast_jsonapi'

# authentication
gem 'jwt'

# debug
gem 'byebug'

group :test do
  gem 'rspec'
  gem 'factory_bot'
  gem 'rack-test'
  gem 'database_cleaner-sequel'
end
