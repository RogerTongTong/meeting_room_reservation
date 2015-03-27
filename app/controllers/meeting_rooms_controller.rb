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

    Reservation.save_records(records, current_user.id)
    redirect_to user_url(current_user)
  end

end
