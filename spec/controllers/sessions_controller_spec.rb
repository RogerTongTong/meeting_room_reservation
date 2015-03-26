require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe "#create" do
    subject { post :create, :session => {
                              email: "Roger.Tong@activenetwork.com",
                              password: "jordan35", } }
    it "should redirect to user_url once input is authenticated" do
      user = User.new
      user.id = 1

      allow(User).to receive(:find_by).and_return(user)
      allow(user).to receive(:authenticate).and_return(true)
      expect(controller).to receive(:log_in).with(user)
      expect(subject).to redirect_to(root_url)
    end

    it "should render new if input is not valid" do
      user = User.new
      user.id = 1
      allow(User).to receive(:find_by).and_return(user)
      allow(user).to receive(:authenticate).and_return(false)

      expect(subject).to render_template :new
    end
  end

  describe "#destroy" do
    it 'should invoke log_out and redirect to root_url' do
      expect(controller).to receive(:log_out)

      get :destroy

      expect(response).to redirect_to(root_url)
    end
  end
end
