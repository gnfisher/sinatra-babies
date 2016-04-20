source 'https://rubygems.org'
ruby '2.2.2'

gem 'sinatra', require: 'sinatra/base'
gem 'rake'
gem 'dotenv'
gem 'bcrypt', '~> 3.1.2'
gem 'sinatra-flash', require: 'sinatra/flash'
gem 'pry'

# Database
gem 'activerecord', require: 'active_record'
gem 'sinatra-activerecord', require: 'sinatra/activerecord'
gem 'sqlite3'

group :development do
  gem 'thin'
  gem 'tux'
  gem 'shotgun'
end

group :test do
  gem 'rspec'
  gem 'rack-test'
  # gem 'pry'
  gem 'capybara'
  gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
end

