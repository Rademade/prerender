set :deploy_to, "/home/deploy/prerender"

server '30dney.ru', user: 'deploy', roles: %w{web app}
