source 'https://rubygems.org'

gem 'rails', '4.0.1.rc3' # '~> 4.0'
gem 'pg', '>= 0.17.0'
gem 'therubyracer', '>= 0.12.0' , platforms: :ruby
gem 'slim-rails', '~> 2.0'
gem 'draper', '~> 1.2'
gem 'bcrypt-ruby', '~> 3.1', require: 'bcrypt'
gem 'sidekiq', '~> 2.15'
gem 'kaminari', '>= 0.14.1'
gem 'redis-rails', '~> 4.0'
gem 'sqlite3'
gem 'jquery-rails', '~> 2.1'
gem 'sass-rails', '~> 4.0'
gem 'rename'
gem 'bootstrap-slider-rails', '~> 1.9.0'

group :test do
  gem 'simplecov', '>= 0.8.0.pre2', require: false
  gem 'test_after_commit', '>= 0.2.1'
end

group :development, :test do
  gem 'rspec-rails', '~> 2.14'
  gem 'factory_girl_rails', '~> 4.2'
  gem 'faker', '~> 1.2'
  gem 'database_cleaner', '~> 1.2'
  gem 'pry-rails', '>= 0.3.2'
  gem 'pry-nav', '>= 0.2.3'
  gem 'pry', '>= 0.9.12.2'
  gem 'hirb', '>= 0.7.1'
  gem 'timecop', '>= 0.6.3'
end

group :development do
  gem 'thin', '~> 1.6'
  gem 'better_errors', '~> 1.0'
  gem 'binding_of_caller', '>= 0.7.2'
  gem 'brakeman', '~> 2.1', require: false
end

group :production, :alpha, :beta, :stage, :live do
  gem 'uglifier', '~> 2.2'
end
