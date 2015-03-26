module MeetingRoomsHelper
  def is_booked?(room, time)
    room.reservations.each do |reservation|
      if Date.current == reservation.date && reservation.time == time
        return true
      end
    end
    return false
  end
end
