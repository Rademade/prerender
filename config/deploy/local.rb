set :deploy_to, "/home/prerender/application-production"

set :rvm_type,          :system
set :rvm_ruby_version,  'ruby-2.3.0@prerender'

server '127.0.0.1', user: 'prerender', port: 2223, roles: %w{web app web}
