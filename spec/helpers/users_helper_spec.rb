require 'rails_helper'

RSpec.describe UsersHelper, type: :helper do
  describe "#generate_reservation_list" do
    it 'should get combined reservation list' do

      user = User.new
      room_1 = Room.new
      room_1.id = 1
      room_1.name = "A"

      room_2 = Room.new
      room_2.id = 2
      room_2.name = "B"

      reservation_1 = Reservation.new
      reservation_1.room = room_1
      reservation_1.time = 1

      reservation_2 = Reservation.new
      reservation_2.room = room_1
      reservation_2.time = 2

      reservation_3 = Reservation.new
      reservation_3.room = room_2
      reservation_3.time = 1

      reservation_4 = Reservation.new
      reservation_4.room = room_2
      reservation_4.time = 3

      reservations = Array.new
      reservations << reservation_1
      reservations << reservation_2
      reservations << reservation_3
      reservations << reservation_4
      final_reservations = helper.generate_reservation_list(reservations)
      expect(final_reservations.count).to eq(2)
      expect(final_reservations[0][:time]).to eq("1,2")
      expect(final_reservations[1][:time]).to eq("1,3")
    end
  end
end
