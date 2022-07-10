require 'rails_helper'

RSpec.describe PartyUser do
  describe 'relationships' do
    it { should belong_to :user }
    it { should belong_to :viewing_party }
  end

  describe 'model methods' do
    it '#invite_guests' do
      jose = User.create!(name: 'Jose Andres', email: 'jose.andres@gmail.com', password: '111',
                          password_confirmation: '111')
      frank = User.create!(name: 'Frank', email: 'frank.andres@gmail.com', password: '111',
                           password_confirmation: '111')
      list = [jose.id, frank.id]
      party = ViewingParty.create!({ duration: 200, date: Date.today, time: 1600, movie_id: 278 })

      PartyUser.invite_guests(list, party.id)

      expect(PartyUser.all.count).to eq(2)
    end
  end
end
