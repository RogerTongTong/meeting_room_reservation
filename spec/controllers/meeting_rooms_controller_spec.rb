require 'rails_helper'

RSpec.describe MeetingRoomsController, type: :controller do
  describe "#submit" do
    context "some check boxes have been selected" do
      subject { post :submit, :records => ["1,2", "1,3", "2,2"] }
      it "should make a new reservation and redirect to user_url" do
        user = User.new
        user.id = 1
        session[:user_id] = 1
        reservation = Reservation.new

        expect(Reservation).to receive(:new).with({room_id: "1", user_id: 1, time: "2", date: Date.current}).and_return(reservation)
        expect(Reservation).to receive(:new).with({room_id: "1", user_id: 1, time: "3", date: Date.current}).and_return(reservation)
        expect(Reservation).to receive(:new).with({room_id: "2", user_id: 1, time: "2", date: Date.current}).and_return(reservation)
        allow(User).to receive(:find_by).and_return(user)
        expect(subject).to redirect_to(user_url(user))
      end
    end

    context "no records parameter in post request" do
      it 'should render home if no records parameter is passed' do
        post :submit
        expect(response).to render_template('home')
      end
    end

  end

end
