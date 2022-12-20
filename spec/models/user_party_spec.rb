require 'rails_helper'

RSpec.describe UserParty do
  describe 'validations' do
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:party) }
  end


  describe 'instance methods' do
    it 'returns user name if user is the host' do
      @user_1 = User.create!(name: 'Ed', email: 'Ed@gmail.com', password_digest: '123')
      @user_2 = User.create!(name: 'Steve', email: 'Steve@gmail.com', password_digest: 'abc')
      @party_1 = Party.create!(date: Date.today, start_time: '20:00:00', movie_id: 278, title: "The Shawshank Redemption", poster: "/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg" )
      @user_viewing_party_1 = UserParty.create!(user_id: @user_1.id, party_id: @party_1.id, host: true)
      @user_viewing_party_2 = UserParty.create!(user_id: @user_2.id, party_id: @party_1.id, host: false)

      expect(@user_viewing_party_1.the_host).to eq('Ed')
    end
  end
end
