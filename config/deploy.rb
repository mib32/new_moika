require "bundler/capistrano"

#require "rvm/capistrano"

#set :rvm_ruby_string, '2.0.0-p247'
#set :rvm_type, :user  # Don't use system-wide RVM

#server "141.8.193.154", :web, :app, :db, primary: true
server "moika-77.ru", :web, :app, :db, primary: true
set :application, "new_moika"
set :user, "deployer"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false
set :scm, "git"
#set :repository, "git@github.com:mib32/#{application}.git"
set :repository, "https://github.com/mib32/new_moika.git"
set :branch, "master"
default_run_options[:pty] = true
ssh_options[:forward_agent] = true
ssh_options[:port] = "1416"



after "deploy:update_code", :update_images_symlink
task  :update_images_symlink, roles => :app do
  run "cp -R #{release_path}/public/uploads/default #{deploy_to}/shared/uploads/ "
  run "rm -rf #{release_path}/public/uploads"
  run "ln -nfs #{deploy_to}/shared/uploads/ #{current_release}/public/uploads"
end

after "deploy", "deploy:cleanup" # keep only the last 5 releases
namespace :deploy do
  %w[start stop restart].each do |command|
    desc "#{command} unicorn server"
    task command, roles: :app, except: {no_release: true} do
      run "/etc/init.d/unicorn_#{application} #{command}"
    end
  end
  # after "deploy","deploy:stop"
  # after "deploy:stop","deploy:start"

  task :setup_config, roles: :app do
    sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
    sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
    run "mkdir -p #{shared_path}/config"
    put File.read("config/database.example.yml"), "#{shared_path}/config/database.yml"
    puts "Now edit the config files in #{shared_path}."
  end
  after "deploy:setup", "deploy:setup_config"
  task :symlink_configs, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/config/oauth.yml #{release_path}/config/oauth.yml"
    run "ln -nfs #{shared_path}/config/mauth.yml #{release_path}/config/mauth.yml"
    run "ln -nfs #{shared_path}/config/robokassa.yml #{release_path}/config/robokassa.yml"
  end
  after "deploy:finalize_update", "deploy:symlink_configs"
  desc "Make sure local git is in sync with remote."
  task :check_revision, roles: :web do
    unless `git rev-parse HEAD` == `git rev-parse origin/master`
      puts "WARNING: HEAD is not the same as origin/master"
      puts "Run `git push` to sync changes."
      exit
    end
  end
  before "deploy", "deploy:check_revision"
end

namespace :rails do
  desc "Remote console"
  task :console, :roles => :app do
    run_interactively "bundle exec rails console #{rails_env}"
  end

  desc "Remote dbconsole"
  task :dbconsole, :roles => :app do
    run_interactively "bundle exec rails dbconsole #{rails_env}"
  end
end

namespace :logs do
  desc "tail rails logs"
  task :tail_rails, :roles => :app do
    trap("INT") { puts 'Interupted'; exit 0; }
    run "tail -f #{shared_path}/log/#{rails_env}.log" do |channel, stream, data|
      puts "#{channel[:host]}: #{data}" 
      break if stream == :err    
    end
  end
end

def run_interactively(command)
  server ||= find_servers_for_task(current_task).first
  exec %Q(ssh #{user}@moika-77.ru -t' #{current_release}/#{command}')
end

after "deploy:create_symlink", "deploy:update_crontab"

namespace :deploy do
  desc "Update the crontab file"
  task :update_crontab, :roles => :db do
    run "cd #{release_path} && whenever --update-crontab #{application}"
  end
end