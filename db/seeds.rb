User.destroy_all
owner_user = User.create!(
  email: "owner@room.com",
  password: "123456789",
  password_confirmation: "123456789"
)


Room.create!(name:"test room", user: owner_user, address: "test address 123", price: 10)

renter = User.create!(
  email: "renter@room.com",
  password: "123456789",
  password_confirmation: "123456789"
)

renter.bookings.create!(
  room: Room.last,
  end_date: Date.today + 10.days,
  start_date: Date.today
)
