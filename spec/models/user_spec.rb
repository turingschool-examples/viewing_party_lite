require "rails_helper"

describe User, type: :model do
  describe "relationships" do
    it { should have_many(:invitations) }
    it { should have_many(:parties).through(:invitations) }
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    describe "email" do
      before do
        @user_1 = User.create!(name: "Tony Soprano", email: "wokeupthismorning@gmail.com")
      end

      it { should allow_value("cleavermovie@gmail.com").for(:email) }
      it { should_not allow_value("wokeupthismorning@gmail.com").for(:email) }
    end
  end
end
