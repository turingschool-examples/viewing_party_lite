require "rails_helper"

RSpec.describe Party, type: :model do
  describe "relationships" do
    it { should have_many :user_parties}
    it { should have_many(:users).through(:user_parties) }
  end
  describe 'validations' do
    it { should validate_presence_of :duration}
    it { should validate_presence_of :day}
    it { should validate_presence_of :start_time}
  end

   describe 'instance methods' do
     it 'should return users that are in a hash key' do
      user_1 = User.create!(name: "Jim", email: "Jim@email.com")
      user_2 = User.create!(name: "Jeff", email: "Jeff@email.com")
      user_3 = User.create!(name: "Jill", email: "Jill@email.com")
      party_1 = user_1.parties.create!(duration: 180, day: "December 12, 2021", start_time: "7:00 pm", movie_id: 1)
      params_hash = {
        "Jeff@email.com" => 1,
        "Jill@email.com" => 1
      }

      expect(party_1.find_invitee(params_hash)).to eq([user_2, user_3])
    end
  end
end
