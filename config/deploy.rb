lock "~> 3.14.0"

set :application, "redmine"
set :repo_url, "git@github.com:trungntd-mirabo/redmine.git"

set :deploy_to, "/var/www/#{fetch :application}"

append :linked_files, "config/database.yml", "config/secrets.yml"

append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system",
  "vendor/bundle"

set :keep_releases, 5

after "deploy:publishing", "deploy:restart"

namespace :deploy do
  task :restart do
    invoke "unicorn:restart"
  end
end
