# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'test-moika'
set :server_name, 'mash.moika-77.ru'
set :repo_url, 'https://github.com/mib32/new_moika.git'
set :pty, true
set :unicorn_pid, '/var/www/test-moika/shared/pids/unicorn.pid'
# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
# set :deploy_to, '/var/www/my_app'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  task :setup_config do
    on roles :app do |host|
      # execute :ln, '-nfs', "#{current_path}/config/nginx.conf", "/etc/nginx/sites-enabled/#{host.properties.app}"
      # run "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{host.properties.app}"
      # run "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{host.properties.app}"
      # run "mkdir -p #{shared_path}/config"
      puts "Now edit the config files in #{shared_path}."
    end
  end

end

namespace :unicorn do
  desc 'Stop Unicorn'
  task :stop do
    on roles(:app) do
      if test("[ -f #{fetch(:unicorn_pid)} ]")
        execute :kill, capture(:cat, "/var/www/test-moika/shared/pids/unicorn.pid")
      end
    end
  end

  desc 'Start Unicorn'
  task :start do
    on roles(:app) do
      within current_path do
        with rails_env: fetch(:rails_env) do
          execute :bundle, "exec unicorn -c #{fetch(:unicorn_config)} -D"
        end
      end
    end
  end

  desc 'Reload Unicorn without killing master process'
  task :reload do
    on roles(:app) do
      if test("[ -f #{fetch(:unicorn_pid)} ]")
        execute :kill, '-s USR2', capture(:cat, "/var/www/test-moika/shared/pids/unicorn.pid")
      else
        error 'Unicorn process not running'
      end
    end
  end

  desc 'Restart Unicorn'
  task :restart
  before :restart, :stop
  before :restart, :start
end

