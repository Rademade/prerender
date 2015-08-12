set :deploy_to, "/var/www/prerender"

set :rvm_type,          :system
set :rvm_ruby_version,  'ruby-2.1.5@prerender'

server 'rademade.com', user: 'deploy', roles: %w{web app}
