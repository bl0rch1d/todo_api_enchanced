source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'puma', '~> 4.3'
gem 'rails', '~> 5.2.3'

# DB
gem 'hiredis', '~> 0.6.3'
gem 'pg', '>= 0.18', '< 2.0'
gem 'redis', '~> 4.1'

# Crypto security
gem 'bcrypt', '~> 3.1.7'
gem 'jwt_sessions', '~> 2.4', '>= 2.4.2'

# CORS
gem 'rack-cors', '~> 1.0', '>= 1.0.3'

# Fake data
gem 'ffaker', '~> 2.11'

# Serializers
gem 'fast_jsonapi', '~> 1.5'

# List managment
gem 'acts_as_list', '~> 0.9.19'

# Cloud storage
gem 'aws-sdk-s3', '~> 1.46'

# Trailblazer bundle
gem 'dry-matcher', '~> 0.8.1'
gem 'reform', '~> 2.2'
gem 'reform-rails', '~> 0.1.7'
gem 'trailblazer-rails', '~> 2.1'

group :test do
  # API Docs
  gem 'dox', '~> 1.1'

  # Data managment
  gem 'database_cleaner', '~> 1.7'
  gem 'factory_bot_rails', '~> 5.0'

  # Test suite
  gem 'json_matchers', '~> 0.11.1'
  gem 'rspec', '~> 3.8'
  gem 'shoulda-matchers', '~> 4.1'
  gem 'simplecov', '~> 0.17.0'
end

group :development, :test do
  gem 'pry-byebug', '~> 3.7'
  gem 'rspec-rails', '~> 3.8'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # Security
  gem 'brakeman', '~> 4.6'
  gem 'bundle-audit', '~> 0.1.0'

  # Linters
  gem 'fasterer', '~> 0.6.0'
  gem 'overcommit', '~> 0.49.1'
  gem 'rails_best_practices', '~> 1.19'
  gem 'rubocop', '~> 0.74.0'
  gem 'rubocop-i18n', '~> 2.0'
  gem 'rubocop-performance', '~> 1.4'
  gem 'rubocop-rails', '~> 2.3'
  gem 'rubocop-rspec', '~> 1.35'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
