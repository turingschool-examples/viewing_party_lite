require 'rails_helper'

RSpec.describe UserViewingParty, type: :model do
  describe 'relationships' do
    it { should belong_to :user }
    it { should belong_to :viewing_party }
  end

  describe 'validations' do
    it { should validate_inclusion_of(:host).in?([true, false]) }
  end

  describe 'instance methods' do
    
    it '#host_user' do
      @user1 = create(:user, name: 'John')
      @user2 = create(:user, name: 'Frank')
      @viewing_party1 = create(:viewing_party, movie_id: 550)
      @user_viewing_party1 = UserViewingParty.create(user: @user1, viewing_party: @viewing_party1, host: true)
      @user_viewing_party1 = UserViewingParty.create(user: @user2, viewing_party: @viewing_party1, host: false)
    
      expect(@user_viewing_party1.host_user).to eq 'John'
      expect(@user_viewing_party1.host_user).to_not eq 'Frank'
    end
  end
end