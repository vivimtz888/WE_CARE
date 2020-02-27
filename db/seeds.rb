
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Room.destroy_all

puts "creating owners and their rooms"

choices = ["old,room", "scary,room", "modern,room", "cozy,room", "luxury,room", "mansion,room", "hotel,room", "terry,crews"]


10.times do
  user = User.new(email: Faker::Internet.email, password: '123456', owner: true)
  user.save
  rand(10).times do
    url = "https://source.unsplash.com/collection/2303151/#{rand(1..9999)}"
    Room.create(name: Faker::FunnyName.four_word_name, address: Faker::Address.full_address, price: rand(100000), user_id: user.id, photo_url:"#{url}")
  end
end

puts "creating non owners"
10.times do
  user = User.new(email: Faker::Internet.email, password: '123456', owner: false  )
  user.save
end

# Booking first room
first_room = Room.first

Booking.create!(
  user: User.last,
  start_date: Date.today - 2.days,
  end_date: Date.today + 2.days,
  room: first_room
)

Booking.create!(
  user: User.last,
  start_date: Date.today + 4.days,
  end_date: Date.today + 7.days,
  room: first_room
)
