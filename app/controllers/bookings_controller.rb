class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :kitchen_sink]

  def create
    @booking = Booking.new(booking_params)
    @room    = Room.find(params[:room_id])

    @booking.user = current_user
    @booking.room = @room

    if @booking.save
      flash[:notice] = "Your Green Pasture Awaits!"
      redirect_to user_bookings_path
    else
      render "rooms/show"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
