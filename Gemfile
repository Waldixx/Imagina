source 'https://rubygems.org'
#Le agregamos la gema heroku para poder realizar el deploy en heroku sin ningun problema
gem 'rails', '3.2.3'
gem 'heroku'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :development, :test do
  gem 'sqlite3-ruby', :require => 'sqlite3'
  gem 'sqlite3'
end
#Le decimos a nuestra aplicacion que cuando este en produccion debe utilizar postgres.
group :production do
  gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platform => :ruby

  gem 'uglifier', '>= 1.0.3'
  gem 'twitter-bootstrap-rails'
end

#Gemas que utilizamos para nuestra app
gem 'jquery-rails'
gem 'carrierwave'
gem 'rmagick'
gem 'remotipart'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
