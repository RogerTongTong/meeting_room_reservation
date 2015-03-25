class MeetingRoomsController < ApplicationController
  def home
    @rooms = Room.all
  end
end
