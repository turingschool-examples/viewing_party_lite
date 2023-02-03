require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
  end

  describe 'class methods' do
    describe '.all_except' do
      it 'returns all users except the one specified' do
        user1,user2,user3 = create_list(:user, 3)

        expect(User.all_except(user1)).to eq([user2,user3])
      end
    end
  end

  describe 'instance methods' do
    describe '.name_and_email' do
      it 'returns string of user name_and_email' do
        user = create(:user, name: "Bob", email: "email@email.com")
        expect(user.name_and_email).to eq("Bob (email@email.com)")
      end
    end

    describe 'invited or hosting' do
      before :each do
        @user1,@user2 = create_list(:user, 2)
        @viewing_party1 = ViewingParty.create(user_id: @user1.id, movie_id: 1, runtime: 1, duration: 2, 
          start_time: Time.now, day: Date.tomorrow, title: "Movie Title", poster_path: "asdf")
        @viewing_party_user1 = ViewingPartyUser.create(user_id: @user2.id, viewing_party_id: @viewing_party1.id)
      end
      it 'returns viewing parties the user is invited to' do
        expect(@user2.invited).to eq([@viewing_party1])
      end
    end
  end
end