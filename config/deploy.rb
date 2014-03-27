# config valid only for Capistrano 3.1
set :rbenv_ruby, '2.1.1'
set :application, 'wisemonkeys'
set :repo_url, 'git@github.com:cvandermeer/wisemonkeys.git'

set :scm, :git

set :format, :pretty
set :log_level, :info

set :linked_dirs, %w{tmp/pids tmp/sockets log public/uploads}

set :default_env, { path: "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH" }
set :keep_releases, 5

#set :normalize_asset_timestamps, false
set :normalize_asset_timestamps, %{public/images public/javascripts public/stylesheets}

set :migration_role, 'postgres' # Defaults to 'db'


namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
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
end
