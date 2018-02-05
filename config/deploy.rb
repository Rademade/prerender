lock '3.4.0'

set :application, 'Prerender'

set :scm, :git
set :repo_url, 'https://github.com/Rademade/prerender.git'

set :linked_dirs, %w{bower_components node_modules}
set :keep_releases, 2
set :default_env, {
  PORT: 4554,
  NODE_HOSTNAME: :localhost
}

namespace :deploy do

  before :publishing, 'app:stop' do
    on roles(:web) do
      within current_path do
        execute './node_modules/.bin/forever', 'stop server.js || true'
      end
    end
  end

  after :published, 'app:start' do
    on roles(:web) do
      within current_path do
        execute './node_modules/.bin/forever', :start, 'server.js'
      end
    end
  end

end
