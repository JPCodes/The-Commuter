source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails', '~> 4.2.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'rest-client', '~> 2.0.1'
gem 'prawn', '~> 2.1.0'
gem 'toastr-rails', '~> 1.0.3'
gem 'dotenv-rails', '~> 2.2.0'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'bootstrap_form', '~> 2.6.0'

gem 'omniauth-google-oauth2', '~> 0.4.1'
gem 'omniauth', '~> 1.6.1'
gem 'omniauth-facebook', '~> 4.0.0'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'pry'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'brakeman', '~> 3.3', '>= 3.3.2', :require => false
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
