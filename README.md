$ rails new razorpay-demo

$ rails g model product title:string description:string price:integer

#routes.rb
  root to: 'products#index'

$ rails g controller Products index

# gemfile
gem 'devise', '~> 4.2'
$ bundle install

$ rails g devise:install

#config/environments/development.rb:
       config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

$ rails g devise User

$ rails db:migrate

# Setting up the Bootstrap and UI header!
 - update stylesheets and javascripts folders!
    gem 'sdoc'
    gem "less-rails"
    gem "twitter-bootstrap-rails"
    gem 'kaminari'
    gem 'figaro'
    gem 'faker'
    gem 'therubyracer'


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


rails g model order product_id:integer price:integer status:string payment_id:string user_id:integer

rails db:migrate

# views/products/index.html.erb
        <h3>Automatic checkout</h3>
        <form action="/purchase" method="POST">
        <script
            src="https://checkout.razorpay.com/v1/checkout.js"
            data-key="rzp_test_asdasdasdaa"
            data-amount="<%= "#{@product.price}" %>"
            data-name="<%= "#{@product.seller.name}" %>"
            data-description="<%= "#{@product.description}" %>"
            data-image="/images/product.jpg"

            data-prefill.name="<%= "#{current_user.name}" %>"
            data-prefill.email="<%= "#{current_user.email}" %>"
            data-theme.color="#F37254"
        >
        </script>
        <input type="hidden" value="<%= "#{@product.id}" %>" name="product_id">
        <input type="hidden" value="<%= "#{current_user.id}" %>" name="user_id">
        </form><br>

# routes.rb
    post '/purchase' => 'orders#purchase_status'
    resources :products

# db/seeds.rb
    User.create!(email: "kaushalkishorersmt@gmail.com", password: "asdfasdf", password_confirmation: "asdfasdf", name: "Kaushal Kishore")
    Seller.create(name:"Kaushal Kishore",description: Faker::Lorem::sentence,email: "kaushal@shopknekt.com",user_id: User.first.id)
    Product.create(title: "T-Shirt",price: 100,description: "This is the cats tshirt",seller_id: Seller.first.id)




.
