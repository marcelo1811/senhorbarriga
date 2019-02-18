# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "seeding 10 users"
1.upto(10) do
  User.create(email: Faker::Internet.email,
              password: 'senha123',
              name: Faker::Name.name,
              phone_number: Faker::PhoneNumber.phone_number);
end
puts "homes seeded"

puts "seeding 10 homes"
1.upto(10) do
  random_id = 2
  Home.create(address: Faker::Address.street_name,
              owner: User.find(random_id),
              description: Faker::ChuckNorris.fact)
end
puts "homes seeded"

puts "seeding 10 listing"
1.upto(10) do
  random_id = 2
  Listing.create(home: Home.find(random_id), student: User.find(random_id))
end
puts "listing seeded"

#  t.string "email", default: "", null: false
#     t.string "encrypted_password", default: "", null: false
#     t.string "reset_password_token"
#     t.datetime "reset_password_sent_at"
