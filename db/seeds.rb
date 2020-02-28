
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Room.destroy_all
Booking.destroy_all

puts "creating owners and their rooms"

addresses = ["Campestre 233, Ciudad de Mexico", "Francia 82, Ciudad de Mexico", "Margaritas 100, Ciudad de Mexico", "Camelia 22, Ciudad de Mexico", "Naranjo 85, Ciudad de Mexico", "Insurgentes 3000, Ciudad de Mexico"]

images_url = ['https://images.unsplash.com/photo-1522771739844-6a9f6d5f14af?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1951&q=80',
              'https://images.unsplash.com/photo-1550581190-9c1c48d21d6c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=998&q=80',
              'https://images.unsplash.com/photo-1537726235470-8504e3beef77?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80',
              'https://images.unsplash.com/photo-1512918728675-ed5a9ecdebfd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80',
              'https://images.unsplash.com/photo-1558442074-3c19857bc1dc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1189&q=80',
              'https://images.unsplash.com/photo-1542889601-399c4f3a8402?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80',
              'https://images.unsplash.com/photo-1560448205-4d9b3e6bb6db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80',
              'https://images.unsplash.com/photo-1553881651-43348b2ca74e?ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
              'https://images.unsplash.com/photo-1486304873000-235643847519?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1189&q=80',
              'https://images.unsplash.com/photo-1544207240-42895ede7c09?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80',
              'https://images.unsplash.com/photo-1553444892-20174939d7bb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80',
              'https://images.unsplash.com/photo-1575918265268-99dd8f4d6254?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80',
              'https://images.unsplash.com/photo-1553444836-bc6c8d340ba7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80',
              'https://images.unsplash.com/photo-1546555648-fb7876c40c58?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1055&q=80',
              'https://images.unsplash.com/photo-1572891086295-6c1c7c476549?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1900&q=80'
]

5.times do
  user = User.new(email: Faker::Internet.email, password: '123456', owner: true)
  user.save
end

images_url.each do |image|
  Room.create(name: Faker::Company.name, address: addresses.sample, price: rand(1000), user_id: User.all.sample.id, photo_url: images_url.sample)
end

puts "creating non owners"
5.times do
  user = User.new(email: Faker::Internet.email, password: '123456', owner: false  )
  user.save
end


