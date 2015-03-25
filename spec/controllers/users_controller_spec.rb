require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "#create" do
    context "with valid input" do
      subject { post :create, :user => {name: "Roger",
                                        email: "Roger.Tong@activenetwork.com",
                                        password: "jordan35",
                                        :password_confirmation => "jordan35"} }
      it 'should redirect to user page if user is saved successfully' do
        expect(subject).to redirect_to(user_url(assigns(:user)))
      end

    end
    context "with invalid input" do
      subject { post :create, :user => {name: "Roger",
                                        email: "Roger.Tong@activenetwork.com",
                                        password: "jordan35",
                                        :password_confirmation => "jordan36"} }
      it 'should redirect to user page if user is saved successfully' do
        expect(subject).to render_template :new
      end
    end
  end
end
