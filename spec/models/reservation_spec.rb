require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe "#save_records" do
    it 'save all of the records into Reservation' do
      records = ["1,2", "1,3", "2,2"]
      user_id = 1
      reservation = Reservation.new

      expect(Reservation).to receive(:new).with({room_id: 1, user_id: 1, time: 2, date: Date.current}).and_return(reservation)
      expect(Reservation).to receive(:new).with({room_id: 1, user_id: 1, time: 3, date: Date.current}).and_return(reservation)
      expect(Reservation).to receive(:new).with({room_id: 2, user_id: 1, time: 2, date: Date.current}).and_return(reservation)

      Reservation.save_records(records, user_id)
    end
  end
end
