class RoomsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user = current_user
    if @dose.save
      redirect_to room_path(@room)
    else
      render :new
    end
  end

  def room_params
    params.require(:room).permit(:name, :price, :address)
  end
end
