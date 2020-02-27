class User::BookingsController < ApplicationController
  def index
    @user_bookings = Booking.where(user: current_user)
    @owner_bookings = Booking.joins(:room).where(rooms: { user: current_user })
  end
end
