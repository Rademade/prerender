lock '3.4.0'

set :application, 'Prerender'

set :scm, :git
set :repo_url, 'https://github.com/Rademade/prerender.git'

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
        execute "kill $(ps aux | grep 'prerender-app' | awk '{print $2}')"
        execute "cd #{current_path} && APP=prerender-app && PORT=4554 node_modules/.bin/forever start server.js >> /dev/null 2>&1"
      end
    end
  end

  after :updated, 'deploy:npm:install'
  after :finishing, 'deploy:app:restart'
  after :finishing, 'deploy:cleanup'

end
