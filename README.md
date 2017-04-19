$ rails new razorpay-demo

$ rails g model product title:string description:string price:integer

#routes.rb
  root to: 'products#index'

$ rails g controller Products index

# gem 'devise', '~> 4.2'
$ bundle install
$ rails g devise:install

#config/environments/development.rb:
       config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

$ rails g devise User
$ rails db:migrate

Seeting up the Bootstrap and UI header
