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

# Application preloader
gem 'spring', '1.6.2', group: :development

# Makes stuff up to prepopulate the database
gem 'faker', '1.6.1'

# Encryption
gem 'bcrypt'

# Time operations
gem 'as-duration'

group :development, :test do
  # Improves rails' default errors
  gem 'binding_of_caller', '0.7.2'
  gem 'better_errors', '2.1.1'
  gem 'web-console', '3.1.1'

  # Makes the rails console look nicer
  gem 'jazz_hands', '0.5.2', github: 'nixme/jazz_hands', branch: 'bring-your-own-debugger'

  # Uses pry instead of default IRB
  gem 'pry-byebug', '1.3.2'

  # Rspec-related gems
  gem 'rspec-rails'
  gem 'guard-rspec', require: false
  gem 'factory_girl_rails'
end

group :production do
  # For heroku
  gem 'rails_12factor'
  ruby '2.3.0'
end
