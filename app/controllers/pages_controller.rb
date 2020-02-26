class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :kitchen_sink]

  def home
    @rooms = Room.all.sample(6)
  end

  def kitchen_sink
  end
end
