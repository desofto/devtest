source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'pg'

gem 'jquery-rails'
gem 'jquery-ui-rails'

gem 'grape'
gem 'grape-entity'

group :development, :test do
  gem 'pry-byebug'
  gem 'pry-rails'
end

group :test do
  gem 'listen'
  gem 'factory_girl_rails'
  gem 'database_cleaner'

  gem 'rspec', require: false
  gem 'rspec-rails'
  gem 'rspec-retry'
  gem 'shoulda-matchers'

  gem 'capybara'
  gem 'capybara-webkit'

  gem 'vcr'
  gem 'webmock'
  gem 'timecop'
end
