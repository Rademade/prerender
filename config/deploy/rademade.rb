set :deploy_to, "/var/www/prerender"

server 'rademade.com', user: 'deploy', roles: %w{web app}
