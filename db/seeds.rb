# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Tag = "photo"
seeds = YAML.load_file('seeds.yml')


puts 'Creating users...'
users = {}  # slug => Director
seeds["users"].each do |user|
  temp = User.create! user.slice(
                              "first_name",
                               "last_name",
                               "phone_number",
                               "password",
                               "email")
  temp.remote_photo_url = user.slice(Tag)[Tag.to_s]
  temp.save
  p "saving:"
  p temp
  p "------------------------------"
end

puts 'Creating homes...'
homes = {}  # slug => Director
seeds["homes"].each do |home|
  temp = Home.create! home.slice(
                              "address",
                              "owner_id",
                              "description",
                              "title",
                              "city",
                              "price",
                              "cep",
                              "description")
  # x.remote_photo_url = "http://res.cloudinary.com/dpkbckolo/image/upload/v1550847678/zgchnp4dlgst2hglh8go.jpg"
  temp.remote_photo_url = home.slice(Tag)[Tag.to_s]
  temp.save
  p "saving:"
  p temp
  p "------------------------------"
end
