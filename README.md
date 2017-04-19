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

Setting up the Bootstrap and UI header!

rails g model seller name description email user_id:integer
rails db:migrate

# models/seller.rb
    belongs_to :user

rails g migration AddNameToUsers name:string

rails g migration AddSellerIdToProducts seller_id:integer

rails db:migrate

# models/product.rb
    belongs_to :seller

# application_controller.rb
---
    before_action :authenticate_user!
    before_filter :configure_permitted_parameters, if: :devise_controller?

    protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end

- Need to name field in the new and edit form of user!
<div class="field">
  <%= f.label :name %><br />
  <%= f.email_field :name, autofocus: true %>
</div>
