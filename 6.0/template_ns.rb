# rails new . --database=postgresql -m https://raw.github.com/technobrain/rails_templates/master/6.0/templates_ns.rb

gsub_file 'Gemfile', /^gem 'jbuilder'.+/, ""
gsub_file 'Gemfile', /^gem 'coffee-rails'.+/, ""
gsub_file 'Gemfile', /gem 'listen'.+/, ""

# Decorator
gem 'active_decorator'

# JSON
gem 'jb'

# Pagination
gem 'kaminari'

gem 'listen', '~> 3.1.0'

# Authorization
gem 'pundit'

# Excel
gem 'rubyXL'

# DB Seed
gem 'seed-fu'

# Template engine
gem 'slim-rails'

# PDF Report
gem "thinreports"

# gem 'ukstyle', github: 'technobrain/ukstyle', branch: 'develop'
gem 'unicorn'

gem_group :development, :test do
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
