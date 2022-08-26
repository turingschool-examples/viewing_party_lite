require 'rails_helper'

RSpec.describe User, :type => :model do
  describe 'associations' do
    it { should have_many(:user_parties) }
    it { should have_many(:parties).through(:user_parties) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_uniqueness_of(:email) }
  end

  before(:each) do
    @user1 = User.create!(name: "Cory", email: 'Cory@gmail.com')
    @user1 = User.create!(name: "John", email: 'John@gmail.com')

    party1 = Party.create!(date: Date.today, start_time: '20:00:00', movie_id: 278)
    party2 = Party.create!(date: Date.today, start_time: '10:00:00', movie_id: 278)
    @up1 = @user1.user_parties.create!(party_id: party1.id, host: true)
    @up2 = @user1.user_parties.create!(party_id: party2.id, host: false)
  end

  describe 'class methods' do
    it "gets all of the user's emails" do
      expect(User.all_emails).to eq(['Cory@gmail.com', 'John@gmail.com'])
    end

    it "gets all the user_parties hosted by the user" do
      expect(@user1.is_host).to eq([@up1])
      expect(@user1.is_host).to_not eq([@up2])
    end

    it "gets all the user_parties the user is invited to" do
      expect(@user1.is_invited).to eq([@up2])
      expect(@user1.is_invited).to_not eq([@up1])
    end

  end
end
