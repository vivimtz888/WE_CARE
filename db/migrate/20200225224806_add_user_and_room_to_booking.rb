class AddUserAndRoomToBooking < ActiveRecord::Migration[5.2]
  def change
    add_reference :bookings, :user, index: true
    add_reference :bookings, :room, index: true
  end
end
