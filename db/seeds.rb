#Users
User.create!(name:  "Example User",
             email: "example@example.com",
             password:              "example",
             password_confirmation: "example",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               admin: true,
               activated: true,
               activated_at: Time.zone.now)
end


#Products
#Product.create!(name: "Product",
#				description: "Description",
#				warehouse: "Warehouse")
#
#99.times do |n|
#	dish = Faker::Food.unique.ingredient
#	description = Faker::Lorem.sentence
#	warehouse = "Warehouse-#{n+1}"
#	Product.create!(name: dish,
#					description: description,
#					warehouse: warehouse)
#end

#Warehouses
Warehouse.create!(	name: "Warehouse-0",
					street: Faker::Address.street_address,
					city: Faker::Address.city,
					state: Faker::Address.state,
					zip: Faker::Address.zip_code,
					phone: Faker::PhoneNumber.phone_number)

9.times do |n|
	name = "Warehouse-#{n+1}"
	street = Faker::Address.street_address
	city = Faker::Address.city
	state = Faker::Address.state
	zip = Faker::Address.zip_code
	phone = Faker::PhoneNumber.phone_number
	Warehouse.create!(	name: name,
						street: street,
						city: city,
						state: state,
						zip: zip,
						phone: phone)
end