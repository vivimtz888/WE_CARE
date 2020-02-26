
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

puts "creating owners and their rooms"


10.times do
  user = User.new(email: Faker::Internet.email, password: '123456', owner: true)
  user.save
  rand(10).times do
    Room.create(name: Faker::FunnyName.four_word_name, address: Faker::Address.full_address, price: rand(100000), user_id: user.id)
  end
end

puts "creating non owners"
10.times do
  user = User.new(email: Faker::Internet.email, password: '123456', owner: false  )
  user.save
end
