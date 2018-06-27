# rails_templates

前提条件
* Databaseがインストールされている
* yarnがインストールされている（Webpackerで利用）
* nodejsがインストールされている（V8がインストールされている、therubyracerが不要）

```
$ mkdir rails_app
$ cd rails_app
$ rbenv local 2.5.1

$ echo "source 'https://rubygems.org'" > Gemfile
$ echo "gem 'rails'" >> Gemfile
$ gem install bundler --no-ri --no-doc
$ bundle install --path=vendor/bundle

# 失敗に備えて一旦コミットしておくといいかも
$ git init
$ git add Gemfile
$ git commit -m 'rails install'

$ bundle exec rails new . --webpack=react --database=postgresql -m https://raw.githubusercontent.com/technobrain/rails_templates/master/5.2/template_basic_app.rb

# .gitignoreを編集してコミット（/vendor/bundleを追加しておくなど）

# 当然DBが稼働していることが前提
$ bin/rails db:create

# foremanでサーバーを起動する場合
$ bundle binstubs bundler --force
を実行しておく必要あり

$ bundle exec foreman start

```
