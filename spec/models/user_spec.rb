require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#downcase_email" do
    it "should make email to lowercase before saving" do
      user = User.new(email: "AAA@AAA.COM", name: "Roger", password: "abcdfaer")
      user.save
      expect(user.email).to eq("aaa@aaa.com")
    end
  end
end
