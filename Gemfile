source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.2.4', '>= 5.2.4.3'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0', '>= 5.0.6'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2', '>= 4.2.2'

gem 'jquery-rails', '>= 4.2.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.6', '>= 2.6.4'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails', '~> 3.5', '>= 3.5.2'
  gem 'sqlite3'
end

group :development do
  gem 'web-console', '>= 3.4.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring', '>= 2.0.1'
  gem 'spring-watcher-listen', '~> 2.0.1'
end

group :test do
  gem 'capybara', '~> 2.12'
end

group :production do
  gem 'pg'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'yt', '~> 0.29.1'
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
gem 'validate_url', '~> 1.0', '>= 1.0.2'
