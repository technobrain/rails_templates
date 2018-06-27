# rails new . --database=postgresql --skip-turbolinks -m https://raw.github.com/technobrain/rails_templates/master/5.1/templates_basic_app.rb

gsub_file 'Gemfile', /^gem 'jbuilder'.+/, ""
gsub_file 'Gemfile', /^gem 'coffee-rails'.+/, ""

gem 'webpacker', '~> 3.5'
gem 'seed-fu'
# Authentication
gem 'sorcery'
# Authorization
gem 'pundit'
# Queue adapter
gem 'sidekiq'

gem 'listen', '>= 3.0.5', '< 3.2'

# Statemachine
gem 'aasm'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger
  # console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]

  gem 'database_cleaner'

  gem 'rubocop', require: false
end

group :development do
  # Spring speeds up development by keeping your application running
  # in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'foreman'
  gem 'brakeman', require: false
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'

  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano3-unicorn'
end

create_file "Procfile", <<-EOF
web: bin/rails s -p 3000
webpacker: bin/webpack-dev-server
EOF

run 'bundle install'
rake 'db:create'

say <<-SAY
============================================================================
  template applied
============================================================================
SAY
