require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many :user_viewing_parties }
    it { should have_many(:viewing_parties).through(:user_viewing_parties) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
  end

  describe 'instance method' do
    it '#movie_search' do
      user1 = create(:user)
    
      expect(user1.movie_search('Air')[:results][0][:original_title]).to eq('Con Air')
      expect(user1.movie_search('Air')).to be_a(Hash)
    end
  end
end