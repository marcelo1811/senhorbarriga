# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

seeds = YAML.load_file('seeds.yml')


puts 'Creating users...'
users = {}  # slug => Director
seeds["users"].each do |user|
  x = User.create! user.slice(
                              "first_name",
                               "last_name",
                               "phone_number",
                               "password",
                               "email")
  a= user.slice("photo")
  x.remote_photo_url = a["photo".to_s]
  x.save
  p x
  p "------------------------------"
end

puts 'Creating homes...'
homes = {}  # slug => Director
seeds["homes"].each do |home|
  x = Home.create! home.slice(
                              "address",
                              "owner_id",
                              "description",
                              "title",
                              "city",
                              "price",
                              "cep")
  # x.remote_photo_url = "http://res.cloudinary.com/dpkbckolo/image/upload/v1550847678/zgchnp4dlgst2hglh8go.jpg"
  a= home.slice("photo")
  x.remote_photo_url = a["photo".to_s]
  x.save
  p x
  p "------------------------------"
end
