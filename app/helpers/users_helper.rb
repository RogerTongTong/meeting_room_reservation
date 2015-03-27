module UsersHelper

  # input format is like:
  # [room_id_1],[1]
  # [room_id_1],[2]
  # [room_id_2],[1]
  # out put should be
  # [room_name_1], [1, 2]
  # [room_name_2],[1]
  def generate_reservation_list(reservations)
    if reservations.nil?
      return
    end
    result = Array.new
    reservations.each do |reservation|
      element = getElementByReservation(result, reservation)
      if element
        element[:time] ="#{element[:time]}, #{reservation.time}:00"
      else
        element = {name: reservation.room.name, time: "#{reservation.time}:00"}
        result << element
      end
    end
    return result
  end

  private

  # Todo: Change to name to ruby style
  def getElementByReservation(result, reservation)
    result.each do |element|
      if element[:name] == reservation.room.name
        return element
      end
    end
    return
  end
end