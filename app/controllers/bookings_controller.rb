class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :kitchen_sink]

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.room = Room.find(params[:room_id])
    if @booking.save
      flash[:notice] = "Booking confirmed!"
      redirect_to root_path
    else
      render :new
    end
  end


  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
