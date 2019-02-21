# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

seeds = YAML.load_file('seeds.yml')
puts seeds

puts 'Creating users...'
users = {}  # slug => Director
seeds["users"].each do |user|
  users[user["first_name"]] = User.create! user.slice(
                              "first_name",
                               "last_name",
                               "phone_number",
                               "password",
                               "email")
end

puts 'Creating homes...'
homes = {}  # slug => Director
seeds["homes"].each do |home|
  homes[home["first_name"]] = Home.create! home.slice(
                              "address",
                              "owner_id",
                              "description",
                              "title",
                              "city",
                              "price",
                              "cep")
end
