lock '3.4.0'

set :application, 'Prerender'

set :scm, :git
set :repo_url, 'git@github.com:Rademade/prerender.git'

set :rvm_type,          :system
set :rvm_ruby_version,  'ruby-2.1.5@prerender'

set :linked_dirs, %w{bower_components node_modules}
set :keep_releases, 2

namespace :deploy do

  task 'npm:install' do
    on roles(:web) do
      within release_path do
        execute :npm, :install
      end
    end
  end

  task 'app:restart' do
    on roles(:web) do
      within current_path do
        execute "kill $(ps aux | grep 'Prerender' | awk '{print $2}')"
        execute "cd #{current_path} && APP=Prerender && PORT=4554 node_modules/.bin/forever start server.js >> /dev/null 2>&1"
      end
    end
  end

  after :updated, 'deploy:npm:install'
  after :updated, 'deploy:app:restart'
  after :finishing, 'deploy:cleanup'

end