class RoomsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
    @booking = Booking.new
    @markers =
      [{
        lat: @room.latitude,
        lng: @room.longitude
      }]
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.photo_url = "https://source.unsplash.com/collection/2303151/#{rand(1..9999)}"
    @room.user = current_user
    if @room.save
      flash[:alert] = "Your Room is Added!"
      redirect_to root_path
    else
      render :new
    end
  end

  def room_params
    params.require(:room).permit(:name, :price, :address)
  end
end
