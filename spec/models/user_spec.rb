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

  describe "instance methods" do
    describe "invited_parties" do
      it "should return parties the user is invited to and for which they are not the host" do
        @user1 = User.create!(name: "User One", email: "user1@test.com")
        @user2 = User.create!(name: "User Two", email: "user2@test.com")
        @user3 = User.create!(name: "User Three", email: "user3@test.com")

        @u1_vp = Party.create!(event_date: DateTime.new(2002, 0o4, 26, 6, 0, 0, "-07:00"), duration: "230 mins", start_time: DateTime.new(2002, 0o4, 26, 6, 0, 0, "-07:00"), user_id: @user1.id, movie_id: 24021)
        @u1_vp_inv_1 = Invitation.create!(user_id: @user1.id, party_id: @u1_vp.id)
        @u1_vp_inv_2 = Invitation.create!(user_id: @user2.id, party_id: @u1_vp.id)

        @u2_vp = Party.create!(event_date: DateTime.new(2002, 0o2, 24, 7, 0, 0, "-07:00"), duration: "230 mins", start_time: DateTime.new(2002, 0o2, 24, 7, 0, 0, "-07:00"), user_id: @user2.id, movie_id: 809)
        @u2_vp_inv_1 = Invitation.create!(user_id: @user2.id, party_id: @u2_vp.id)
        @u2_vp_inv_2 = Invitation.create!(user_id: @user3.id, party_id: @u2_vp.id)
        @u2_vp_inv_2 = Invitation.create!(user_id: @user1.id, party_id: @u2_vp.id)

        @u3_vp = Party.create!(event_date: DateTime.new(2002, 0o2, 24, 7, 0, 0, "-07:00"), duration: "230 mins", start_time: DateTime.new(2002, 0o2, 24, 7, 0, 0, "-07:00"), user_id: @user2.id, movie_id: 809)
        @u2_vp_inv_1 = Invitation.create!(user_id: @user2.id, party_id: @u3_vp.id)
        @u2_vp_inv_2 = Invitation.create!(user_id: @user3.id, party_id: @u3_vp.id)

        expect(@user1.invited_parties).to eq([@u2_vp])
        expect(@user2.invited_parties).to eq([@u1_vp])
        expect(@user3.invited_parties).to eq([@u2_vp, @u3_vp])
      end
    end

    describe "hosting_parties" do
      it "should return parties that the user is hosting" do
        @user1 = User.create!(name: "User One", email: "user1@test.com")
        @user2 = User.create!(name: "User Two", email: "user2@test.com")
        @user3 = User.create!(name: "User Three", email: "user3@test.com")

        @u1_vp = Party.create!(event_date: DateTime.new(2002, 0o4, 26, 6, 0, 0, "-07:00"), duration: "230 mins", start_time: DateTime.new(2002, 0o4, 26, 6, 0, 0, "-07:00"), user_id: @user1.id, movie_id: 24021)
        @u1_vp_inv_1 = Invitation.create!(user_id: @user1.id, party_id: @u1_vp.id)
        @u1_vp_inv_2 = Invitation.create!(user_id: @user2.id, party_id: @u1_vp.id)

        @u2_vp_1 = Party.create!(event_date: DateTime.new(2002, 0o2, 24, 7, 0, 0, "-07:00"), duration: "230 mins", start_time: DateTime.new(2002, 0o2, 24, 7, 0, 0, "-07:00"), user_id: @user2.id, movie_id: 809)
        @u2_vp_inv_1 = Invitation.create!(user_id: @user2.id, party_id: @u2_vp_1.id)
        @u2_vp_inv_2 = Invitation.create!(user_id: @user3.id, party_id: @u2_vp_1.id)
        @u2_vp_inv_3 = Invitation.create!(user_id: @user1.id, party_id: @u2_vp_1.id)

        @u2_vp_2 = Party.create!(event_date: DateTime.new(2002, 0o2, 24, 7, 0, 0, "-07:00"), duration: "230 mins", start_time: DateTime.new(2002, 0o2, 24, 7, 0, 0, "-07:00"), user_id: @user2.id, movie_id: 809)
        @u2_vp_inv_1 = Invitation.create!(user_id: @user2.id, party_id: @u2_vp_2.id)
        @u2_vp_inv_2 = Invitation.create!(user_id: @user3.id, party_id: @u2_vp_2.id)

        expect(@user1.hosting_parties).to eq([@u1_vp])
        expect(@user2.hosting_parties).to eq([@u2_vp_1, @u2_vp_2])
        expect(@user3.hosting_parties).to eq([])
      end
    end
  end
end
