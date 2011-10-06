source 'http://rubygems.org'

# gem 'rails', '3.1.0.rc6'

# Bundle edge Rails instead:
gem 'rails', :git => 'git://github.com/rails/rails.git', :branch => "3-1-stable"

gem 'mysql2'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0.rc"
  gem 'coffee-rails', "~> 3.1.0.rc"
  gem 'uglifier'
  gem 'compass', :git => 'git://github.com/chriseppstein/compass.git', :branch => 'rails31'
end

#------------------------------------------------------------------
#supuestamente lo arreglan para 3.1
#para el javascripts runtime
gem 'therubyracer'

# gem 'sprockets', :git => 'git://github.com/sstephenson/sprockets.git'
#-------------------------------------------------------------------

gem 'jquery-rails'

# paginacion
gem 'kaminari'
# busqueda
gem "meta_search","~> 1.1.x"
# formularios
gem 'formtastic', '~> 2.0.0.rc5'
# tablas
gem "tabletastic"

# Use thin as the web server
# gem 'thin'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
gem 'pry', :group => :development

group :development, :test do
  gem 'rspec-rails', '~> 2.5'
  gem 'factory_girl_rails'
  gem 'forgery'
  gem 'guard-rspec'
  gem 'rb-inotify'
  gem 'libnotify'
#  gem 'guard-livereload'
end

group :test do
  gem 'capybara'
  gem 'launchy'
  gem 'shoulda-matchers'
end
