#Users
User.create!(name:  "Example User",
             email: "example@example.com",
             password:              "example",
             password_confirmation: "example",
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               admin: true)
end

#Products
Product.create!(name: "Product",
				description: "Description",
				warehouse: "Warehouse")

99.times do |n|
	name = Faker::Name.name
	description = "description-#{n+1}"
	warehouse = "Warehouse-#{n+1}"
	Product.create!(name: name,
					description: description,
					warehouse: warehouse)
end