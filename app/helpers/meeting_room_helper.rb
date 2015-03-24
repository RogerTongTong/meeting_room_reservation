module MeetingRoomHelper
  def is_booked_at_that_time?(room, time)
    room.reservations.each do |reservation|
      if reservation.time == time
        return true
      end
    end
    return false
  end
end
