source 'http://rubygems.org'

ruby "2.2.2"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.1.1'
# Use postgresql as the database for Active Record
gem 'pg'#, '~> 0.18.3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-datatables-rails'
gem 'jquerycsv-rails'
gem 'select2-rails'

gem 'd3-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
#gem 'spring',        group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
gem 'unicorn'#, group: :production

# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# File Storage
gem 'paperclip', "~> 4.2"
gem 'aws-sdk'

# Authentication
gem 'devise'

# Authorization
gem 'pundit'

# Roles
gem 'royce'

# Markup
gem 'haml-rails'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw]


#Rails Admin
gem 'rails_admin'
gem 'rails_admin_import'

#Tagging
gem 'acts-as-taggable-on', '~> 3.4'

#Javascript library for blocking a page to display a message or menu
gem 'blockuijs-rails',  :git => 'git://github.com/rusanu/blockuijs-rails.git'

group :production do
  gem 'exception_notification'
end



group :development, :test do
  gem 'railroady'
  gem 'metric_fu'
end

