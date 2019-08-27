# rails new . --database=postgresql -m https://raw.githubusercontent.com/technobrain/rails_templates/master/6.0/template_ns.rb

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
rails_command 'webpacker:install:stimulus'
rails_command 'db:create'

environment "config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]"
environment "config.i18n.default_locale = :ja"
environment "config.time_zone = 'Tokyo'"

initializer 'ukstyle.rb', <<-CODE
  Rails.application.config.generators do |g|
    g.template_engine :slim
    g.orm :active_record
    g.assets false
    g.helper false
    g.scaffold_stylesheet false
    # g.template_engine :all
    # g.fallbacks[:all] = :erb
    # g.test_framework :rspec,
    #                  controller_specs: false,
    #                  view_specs: false,
    #                  routing_specs: false,
    #                  helper_specs: false

    # g.test_framework :minitest, spec: false, fixture: true
    # g.system_tests nil
    # g.fallbacks[:minitest] = :rspec
    # g.templates.unshift File::expand_path('../../../lib/templates', __FILE__)
  end

  # Apply UIkit alert form
  # TODO append to gem
  Rails.application.config.action_view.field_error_proc = proc do |html_tag, _instance_tag|
    input_forms = %w[input textarea select]
    html = html_tag
    elem = Nokogiri::HTML::DocumentFragment.parse(html_tag).css 'label'
    if elem.first
      elem.first.attributes['class'].value += ' uk-text-danger'
      html = elem.to_html.html_safe
    else
      input_forms.each do |form|
        elem = Nokogiri::HTML::DocumentFragment.parse(html_tag).css(form)
        if elem.first
          elem.first.attributes['class'].value += ' uk-form-danger'
          html = elem.to_html.html_safe
        end
      end
    end
    html
  end
CODE


say <<-SAY
============================================================================
  template applied
============================================================================
SAY
