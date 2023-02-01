require 'rails_helper'

RSpec.describe User do
  describe 'relationships' do
    it { should have_many :viewing_party_users}
    it { should have_many(:viewing_parties).through(:viewing_party_users) }
  end
  
  describe 'validations' do
    it { should validate_presence_of :email }
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :email }
  end

  describe '#find_viewing_party_user()' do
    it 'returns the viewing party user for the given viewing party' do
      @user1 = User.create!(name: 'John Doe', email: 'johndoe@ymail.com')
      @vp1 = ViewingParty.create!(movie_id: 1, date: 'Mon, 30 Jan 2023', party_duration: 118, start_time: Time.parse('19:00:00 UTC'))
      @vp2 = ViewingParty.create!(movie_id: 2, date: 'Tue, 31 Jan 2023', party_duration: 95, start_time: Time.parse('20:00:00 UTC'))
      @vpu1 = @user1.viewing_party_users.create!(viewing_party_id: @vp1.id, hosting: true)
      @vpu2 = @user1.viewing_party_users.create!(viewing_party_id: @vp2.id, hosting: false)
      
      expect(@user1.find_viewing_party_user(@vp1)).to eq(@vpu1)
      expect(@user1.find_viewing_party_user(@vp2)).to eq(@vpu2)
    end
  end
end