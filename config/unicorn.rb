root = "/var/www/test-moika/current"
working_directory root
pid "/var/www/test-moika/shared/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"
listen "/tmp/unicorn.test-moika.sock"
worker_processes 2
timeout 30
preload_app true
