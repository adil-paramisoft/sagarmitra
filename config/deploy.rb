require 'bundler/capistrano'
require "rvm/capistrano"

default_run_options[:pty] = true

set :application, "sagarmitra"
set :repository, "git@bitbucket.org:paramisoft/sagarmitra.git"

set :use_sudo, false
set :user, "ec2-user"
set :deploy_to, "/home/ec2-user/applications/sagarmitra"

set :branch, 'master'

ssh_options[:keys] = [File.join(ENV["HOME"], ".ssh", "Initiativers.pem")]
#set :ssh_options, {:forward_agent => true}
#on :start do    
#    `ssh-add`
#end

load 'deploy/assets'

set :deployment_server, "54.225.90.83"

set :default_branch, 'master'
set :branch, ENV['branch'] || ENV['BRANCH'] || default_branch

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, deployment_server # Your HTTP server, Apache/etc
role :app, deployment_server # This may be the same as your `Web` server
role :db, deployment_server, :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts


namespace :deploy do
  desc "Symlinks the database.yml"
  task :symlink_db, :roles => :app do
    run "ln -nfs #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
  end
end

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do
    ;
  end
  task :stop do
    ;
  end
  task :restart, :roles => :app, :except => {:no_release => true} do
    run "#{try_sudo} touch #{File.join(current_path, 'tmp', 'restart.txt')}"
  end
end

#set :rvm_ruby_string, "ruby 2.0.0p247"  # use the same ruby as used locally for deployment
#set :rvm_autolibs_flag, "read-only"        # more info: rvm help autolibs

#before 'deploy:setup', 'rvm:install_rvm'   # install RVM
#before 'deploy:setup', 'rvm:install_ruby'  # install Ruby and create gemset, OR:

after "deploy:update_code", "deploy:symlink_db"
after "deploy", "deploy:migrate"
