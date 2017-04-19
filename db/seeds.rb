User.create!(email: "kaushalkishorersmt@gmail.com", password: "asdfasdf", password_confirmation: "asdfasdf", name: "Kaushal Kishore")
Seller.create(name:"Kaushal Kishore",description: Faker::Lorem::sentence,email: "kaushal@shopknekt.com",user_id: User.first.id)
Product.create(title: "T-Shirt",price: 100,description: "This is the cats tshirt",seller_id: Seller.first.id)
