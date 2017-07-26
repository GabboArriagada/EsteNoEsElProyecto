require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/nginx'
require 'capistrano/rbenv'
require 'capistrano/puma'
install_plugin Capistrano::Puma
require 'capistrano/puma/nginx'
install_plugin Capistrano::Puma::Nginx
require 'capistrano/rails'
require 'capistrano/rails/db'
require 'capistrano/rails/console'
require 'capistrano/upload-config'
require 'sshkit/sudo'
require 'capistrano/rails/console'
require 'capistrano/bundler'

require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
