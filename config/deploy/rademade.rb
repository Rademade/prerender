set :deploy_to, "/home/prerender/application-production"

set :rvm_type,          :system
set :rvm_ruby_version,  'ruby-2.3.0@prerender'

server 'rademade.com', user: 'prerender', roles: %w{web app web}
