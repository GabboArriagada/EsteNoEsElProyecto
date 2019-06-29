source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

group :development do
  gem "rails-erd"
end
gem 'pg_search'
gem 'rails-assets-sweetalert2', '~> 5.1.1', source: 'https://rails-assets.org'
gem 'sweet-alert2-rails'
gem 'kaminari'
gem 'kaminari-i18n'
gem 'bootstrap-kaminari-views'
gem 'rails-i18n'
gem 'rails_admin_import', '~> 2.0'
gem 'rails_admin-i18n'
gem 'rails_admin'
gem 'rolify'
gem 'awesome_print'
gem 'rut_validation'
gem 'mail_form'
gem 'figaro'
gem 'select2-rails', github: 'argerim/select2-rails'
gem 'pry'
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'
gem 'jquery-ui-rails'
gem 'bootstrap_file_input_rails'
gem 'bootstrap3-datetimepicker-rails', github: 'TrevorS/bootstrap3-datetimepicker-rails'
#gema para formularios anidados
gem 'cocoon'
#administra permisos
gem 'cancan'
gem 'simple_form'
gem 'faker'
gem 'carrierwave-i18n'
gem 'carrierwave'
gem 'mini_magick'
gem 'devise-i18n'
gem 'devise'
gem 'bootstrap-sass'
gem 'devise-bootstrap-views'
gem 'bootstrap-sass'
gem 'bootswatch-rails'
gem 'bootstrap3-datetimepicker-rails', github: 'TrevorS/bootstrap3-datetimepicker-rails'
gem 'font-awesome-rails'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rails_layout'
  gem 'capistrano'
  gem 'capistrano-rvm'
  gem 'capistrano-nginx'
  gem 'capistrano3-puma'
  gem 'capistrano-rails'
  gem 'capistrano-rails-db'
  gem 'capistrano-rails-console'
  gem 'capistrano-upload-config'
   gem 'capistrano-bundler'
  gem 'sshkit-sudo'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
