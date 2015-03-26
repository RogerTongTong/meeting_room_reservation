class MeetingRoomsController < ApplicationController
  def home
    @rooms = Room.all
  end

  def submit
    records = params[:records]
    if records.nil?
      render 'home'
      return
    end

    records.each do |record|
      array = record.split(',') # record: "[room_id], [time]"
      reservation = Reservation.new({room_id: array[0], user_id: current_user.id, time: array[1], date: Date.current})
      reservation.save
    end
    redirect_to user_url(current_user)
  end

end
