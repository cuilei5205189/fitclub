source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.0"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.0.alpha2"

# Use sqlite3 as the database for Active Record

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem "jsbundling-rails", "~> 0.1.0"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails", git: 'https://github.com/hotwired/turbo-rails', :tag => 'v0.9.0'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails", ">= 0.4.0"

# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem "cssbundling-rails", ">= 0.1.0"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder", "~> 2.7"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.4", require: false

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem "bcrypt", "~> 3.1.7"

# Use Sass to process CSS
# gem "sassc-rails", "~> 2.1"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # Start debugger with binding.b [https://github.com/ruby/debug]
  gem "debug", ">= 1.0.0", platforms: %i[ mri mingw x64_mingw ]
  gem "sqlite3", "~> 1.4"
end

group :production do
  gem 'pg'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console", ">= 4.1.0"
  gem 'rails-erd'
  gem "pry-rails", "~> 0.3.9"
  gem "pry-byebug", "~> 3.8"
 
  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler", ">= 2.3.3"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara", ">= 3.26"
  gem "selenium-webdriver"
  gem "webdrivers"
end

gem 'devise', git: 'https://github.com/heartcombo/devise', branch: 'main'
gem "simple_form", "~> 5.1"
gem 'devise-i18n'

gem "dotenv-rails", "~> 2.7"


gem "faker", "~> 2.19"

gem "rails-i18n", "~> 6.0"



gem "aasm", "~> 5.2"

gem "ransack", github: 'activerecord-hackery/ransack'

gem "aws-sdk-s3", require: false

gem "rack-cors", "~> 1.1"
