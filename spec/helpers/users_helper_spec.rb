require 'rails_helper'

def generate_reservation(room, time)
  reservation = Reservation.new
  reservation.room = room
  reservation.time = time
  reservation
end

def generate_room(id, name)
  room = Room.new
  room.id = id
  room.name = name
  room
end

RSpec.describe UsersHelper, type: :helper do
  describe "#generate_reservation_list" do
    it 'should get combined reservation list' do
      room_1 = generate_room(1, "A")
      room_2 = generate_room(2, "B")

      reservation_1 = generate_reservation(room_1, 1)
      reservation_2 = generate_reservation(room_1, 2)
      reservation_3 = generate_reservation(room_2, 1)
      reservation_4 = generate_reservation(room_2, 3)

      reservations = Array.new
      reservations << reservation_1
      reservations << reservation_2
      reservations << reservation_3
      reservations << reservation_4

      final_reservations = helper.generate_reservation_list(reservations)

      expect(final_reservations.count).to eq(2)
      expect(final_reservations[0][:time]).to eq("1:00, 2:00")
      expect(final_reservations[1][:time]).to eq("1:00, 3:00")
    end
  end
end
