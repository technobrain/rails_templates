# rails_templates

```
$ mkdir rails_app
$ cd rails_app
$ rbenv local 2.4.3

$ echo "source 'https://rubygems.org'" > Gemfile
$ echo "gem 'rails'" >> Gemfile
$ gem install bundler --no-ri --no-doc
$ bundle install --path=vendor/bundle

# 失敗に備えて一旦コミットしておくといいかも
$ git init
$ git add Gemfile
$ git commit -m 'rails install'

$ bundle exec rails new . --database=mysql -T --skip-turbolinks -m https://raw.githubusercontent.com/technobrain/rails_templates/master/5.1/template_basic_app.rb

# .gitignoreを編集してコミット（/vendor/bundleを追加しておくなど）

# Webpackerのインストール（yarnがインストールされていないとエラー）
$ bin/rails webpacker:install

# 当然DBが稼働していることが前提
$ bin/rails db:create

# foreman をつかってサーバーを起動する場合
$ bundle binstubs bundler --force
を実行しておく必要あり

$ bundle exec foreman start

```
