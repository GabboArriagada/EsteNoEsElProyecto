# config valid only for current version of Capistrano

set :application, 'EsteNoEsElProyecto'
set :repo_url, 'git@github.com:maapakn/EsteNoEsElProyecto.git'
set :pty, true
set :user, 'ubuntu'
set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :rails_env, 'production'
set :linked_files, fetch(:linked_files, []).push('config/puma.rb')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/vendor', 'public/uploads')

# Puma:
set :puma_conf, "#{shared_path}/config/puma.rb"
namespace :deploy do
  before 'check:linked_files', 'puma:config'
  before 'check:linked_files', 'puma:nginx_config'
  before 'deploy:migrate', 'deploy:db:create'
  after 'puma:smart_restart', 'nginx:restart'
end
