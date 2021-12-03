# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many :user_parties }
    it { should have_many(:viewing_parties).through(:user_parties) }
  end

  describe 'class methods' do
    it 'all but current' do
      user_1 = create(:user)
      user_2 = create(:user)
      user_3 = create(:user)
      user_4 = create(:user)

      expect(User.all_but_current(user_1)).to eq([user_2, user_3, user_4])
    end
  end
end
