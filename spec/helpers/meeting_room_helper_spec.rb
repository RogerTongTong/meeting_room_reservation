require 'rails_helper'

def create_room (reserved_time)
  room = Room.new
  reservation = Reservation.new
  reservation.time = reserved_time
  room.reservations << reservation
  return room
end

RSpec.describe MeetingRoomHelper, type: :helper do
  describe "#is_booked_at_that_time?" do
    it "returns true if the room is booked at provided time " do
      room = create_room(2)
      expect(helper.is_booked_at_that_time?(room, 2)).to eq(true)
    end

    it "returns false if the room is not booked at provided time" do
      room = create_room(2)
      expect(helper.is_booked_at_that_time?(room, 3)).to eq(false)
    end
  end
end
