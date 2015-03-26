require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "#create" do
    context "with valid input" do
      subject { post :create, :user => {name: "Roger",
                                        email: "Roger.Tong@activenetwork.com",
                                        password: "jordan35",
                                        :password_confirmation => "jordan35"} }
      it 'should redirect to user page if user is saved successfully' do
        expect(subject).to redirect_to(root_url)
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

  describe "#new" do
    it 'should make a new User object as instance variable' do
      user = User.new
      expect(User).to receive(:new).and_return(user)

      get :new

      expect(assigns(:user)).to eq(user)
    end
  end

  describe "#show" do
    it 'should find user with id parameter and assign it as instance variable' do
      user = User.new
      expect(User).to receive(:find).with("1").and_return(user)

      get(:show, {id: 1})

      expect(assigns(:user)).to eq(user)
    end
  end
end
