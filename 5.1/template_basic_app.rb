# bundle exec rails new . --database=postgresql -T --skip-turbolinks -m https://raw.github.com/technobrain/rails_templates/master/5.1/templates_basic_app.rb

gsub_file 'Gemfile', /^gem 'turbolinks'.+/, ""
gsub_file 'Gemfile', /^gem 'jbuilder'.+/, ""
gsub_file 'Gemfile', /^gem 'coffee-rails'.+/, ""
gsub_file 'Gemfile', /^gem 'jbuilder'.+/, ""
gsub_file 'Gemfile', /^  gem 'listen'.+/, ""

gem 'webpacker', '~> 3.0'
gem 'seed-fu'
# Authentication
gem 'sorcery'
# Authorization
gem 'pundit'
# Queue adapter
gem 'sidekiq'

# listen は development, testグループに限定しない
gem 'listen', '~> 3.1.0'

gem_group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger
  # console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]

  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'rspec-rails'

  gem 'rubocop', require: false
end

gem_group :development do
  # Spring speeds up development by keeping your application running
  # in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'foreman'
  gem 'brakeman', require: false
  # Access an IRB console on exception pages or by using <%= console %>
  # anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

create_file "Procfile", <<-EOF
web: bin/rails s -p 3000
webpacker: bin/webpack-dev-server
EOF

run 'bundle install --path vendor/bundle'
rake 'db:create'
rake 'db:migrate'

say <<-SAY
============================================================================
  template applied
============================================================================
SAY
