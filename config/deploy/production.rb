set :user, "deploy"
set :branch, "master"

server "18.179.35.22", user: fetch(:user), roles: %w(web app db)
