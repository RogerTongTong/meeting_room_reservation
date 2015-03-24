class MeetingRoomController < ApplicationController
  def home
    @rooms = Room.all
  end
end
