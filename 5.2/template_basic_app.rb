# rails new . --database=postgresql --skip-turbolinks -m https://raw.github.com/technobrain/rails_templates/master/5.1/templates_basic_app.rb

gsub_file 'Gemfile', /^gem 'jbuilder'.+/, ""
gsub_file 'Gemfile', /^gem 'coffee-rails'.+/, ""
gsub_file 'Gemfile', /gem 'listen'.+/, ""

gem 'seed-fu'
# Authentication
gem 'sorcery'
# Authorization
gem 'pundit'
# Queue adapter
gem 'sidekiq'

gem 'active_decorator'
gem 'jb'
gem 'kaminari'
gem 'listen', '~> 3.1.0'
gem 'swagger_ui_engine'
gem 'swagger-blocks'
gem 'swagger_codegen_rails'
# gem 'uikit_admin_rails', github: 'technobrain/uikit_admin_rails', branch: 'feature/layout'
gem 'ukstyle', github: 'technobrain/ukstyle', branch: 'develop'
gem 'unicorn'

# Statemachine
gem 'aasm'

# QR code
gem 'rqrcode'

gem_group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger
  # console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]

  # Exists N+1 queries, unused eager loding
  gem 'bullet'
end

gem_group :test do
  gem 'capybara'
  gem 'minitest-rails'
  gem "minitest-stub_any_instance"
  gem 'rails-controller-testing'
end

gem_group :development do
  # Spring speeds up development by keeping your application running
  # in the background. Read more: https://github.com/rails/spring
  gem 'brakeman', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rubocop'
  gem 'rubocop-performance'

  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'

  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano3-unicorn'
end

run 'bundle install'
rake 'db:create'

say <<-SAY
============================================================================
  template applied
============================================================================
SAY
