#############################################################
## General
#############################################################
set :application, "moovy"


#############################################################
## Servers 
#############################################################
set :use_sudo, false    # Dreamhost does not support sudo
set :user, "bjeanes"  # Dreamhost SSH User
set :domain, "moovy.bjeanes.com"

server domain, :app, :web
role :db, domain, :primary => true


#############################################################
## Subversion
#############################################################
default_run_options[:pty] = true
set :repository,  "git@github.com:bjeanes/moovy.git"
set :scm, "git"
set :deploy_to, "/home/#{user}/domains/#{domain}"
set :branch, "master"
set :deploy_via, :remote_cache
set :git_enable_submodules, 1
ssh_options[:forward_agent] = true


#############################################################
## Tasks
#############################################################

namespace :deploy do
  desc "Restart Application (using tmp/restart.txt)"
  task :restart_passenger do
    run "touch #{current_path}/tmp/restart.txt"
  end

  desc "Restarts your application."
  task :restart do
    restart_passenger
  end

  desc "Link shared files"
  task :symlink_shared do
    run "rm -drf #{release_path}/public/uploads"
    run "ln -s #{shared_path}/uploads #{release_path}/public/uploads"
    run "rm -f #{release_path}/config/database.yml"
    run "ln -s #{shared_path}/database.yml #{release_path}/config/database.yml"
  end
  
  before "deploy:symlink", "deploy:symlink_shared"
end