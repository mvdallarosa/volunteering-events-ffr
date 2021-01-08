# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'
require 'faker'

User.destroy_all

# url = 'https://pixabay.com/api/?key=8552570-540dab6f18162a9471dc11307&q=face&image_type=photo&pretty=true'
# images_serialized = open(url).read
# images = JSON.parse(images_serialized)

puts 'Creating 10 users'
t_count = 1
10.times do
  url = 'https://source.unsplash.com/500x500/?portrait'
  file = URI.open(url)
  user = User.new(
    email: "volunteer#{t_count}@email.com",
    password: "123456",
    first_name: "#{Faker::Name.first_name}",
    last_name: "#{Faker::Name.last_name}",
    phone_number: "#{Faker::PhoneNumber.cell_phone}"
  )
  user.photo.attach(io: file, filename: "volunteer#{t_count}.png", content_type: 'image/png')
  t_count += 1
  user.save
end
puts 'Finished!'

puts 'Creating 2 admins'
a_count = 1
2.times do
  url = 'https://source.unsplash.com/500x500/?portrait'
  file = URI.open(url)
  user = User.new(
    email: "admin#{a_count}@email.com",
    password: "123456",
    first_name: "#{Faker::Name.first_name}",
    last_name: "#{Faker::Name.last_name}",
    phone_number: "#{Faker::PhoneNumber.cell_phone}",
    admin: true
  )
  user.photo.attach(io: file, filename: "teacher#{a_count}.png", content_type: 'image/png')
  a_count += 1
  user.save
end
puts 'Finished!'
