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
    @room.photo_url = "https://images.unsplash.com/photo-1581543591520-afa01e4d7e7b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=967&q=80"
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
