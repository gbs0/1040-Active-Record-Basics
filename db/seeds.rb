# This is where you can create initial data for your app.
require 'faker'
require "json"
require "rest-client"
require 'pry'
response = RestClient.get "https://api.github.com/users/lewagon/repos"
repos = JSON.parse(response)
# => repos is an `Array` of `Hashes`.


Restaurant.destroy_all

repos.each do |repo|
    restaurant = Restaurant.new(
        name: repo["name"],
        address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
        rating:  rand(0..5)
    )
    restaurant.save!
end

puts "Creating Restaurants..."
burger_king = Restaurant.new(
    name: "Burger King",
    address: "Av. Paulista, 123",
    rating: 4
)
burger_king.save!

tour_d_argent = Restaurant.new(name: "La Tour d'Argent",
    address: "Rue de La France, 34",
    rating: 5
)
tour_d_argent.save!

chez_gladines = Restaurant.new(name: "Chez Gladines",
    address: "Rua Mocoroca, 45",
    rating: 3
)
chez_gladines.save!

100.times do
  restaurant = Restaurant.new(
     name: Faker::Restaurant.name,
     address: Faker::Address.street_address,
     rating: rand(0..5)
  )
  restaurant.save!
end

puts "Finished Creating Restaurants!"