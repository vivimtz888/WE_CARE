class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :kitchen_sink]

  def home
    # TODO: ask Caio how make this efficient
    @rooms = Room.all.sample(6)
  end

  def kitchen_sink
  end
end
