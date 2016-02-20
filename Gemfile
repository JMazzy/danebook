source 'https://rubygems.org'

# Core
gem 'rails', '4.2.5'

# PostgresQL database
gem 'pg', '0.18.4'

# CSS
gem 'sass-rails', '5.0.4'
gem 'bootstrap-sass', '3.3.6'
gem 'autoprefixer-rails', '6.3.1'

# Javascript
gem 'coffee-rails', '4.1.1'
gem 'jquery-rails', '4.1.0'
gem 'jbuilder', '2.4.0'

# Minifies code for smallness' sake...
gem 'uglifier', '2.7.2'

# Documentation
gem 'sdoc', '0.4.1', group: :doc

# Makes stuff up to prepopulate the database
gem 'faker', '1.6.1'

# Encryption
gem 'bcrypt', '3.1.10'

# Time operations
gem 'as-duration', '0.1.0'

# File uploads
gem 'paperclip'
gem 'aws-sdk'

group :development do
  # Application preloader
  gem 'spring', '1.6.2'

  # Improves rails' default errors
  gem 'binding_of_caller', '0.7.2'
  gem 'better_errors', '2.1.1'
  gem 'web-console', '3.1.1'

  # Makes the rails console look nicer
  gem 'jazz_hands', '0.5.2', github: 'nixme/jazz_hands', branch: 'bring-your-own-debugger'
end

group :development, :test do
  # Uses pry instead of default IRB
  gem 'pry-byebug', '1.3.2'

  # Rspec-related gems
  gem 'rspec-rails', '3.4.2'
  gem 'guard-rspec', '4.6.4', require: false
  gem 'factory_girl_rails', '4.6.0'
  gem 'capybara', '2.6.2'
  gem 'launchy', '2.4.3'
  gem 'shoulda-matchers'
end

group :production do
  # For heroku
  gem 'rails_12factor', '0.0.3'
  ruby '2.3.0'
end
