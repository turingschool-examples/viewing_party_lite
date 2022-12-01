# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end

  describe 'relationships' do
    it { should have_many(:user_movie_parties) }
    it { should have_many(:movie_parties).through(:user_movie_parties) }
  end

  before(:each) do
    @user1 = create(:user)
    @user2 = create(:user)
    @user3 = create(:user)
  end

  describe 'class methods' do
    describe '#find_all_except' do
      it 'returns all users except user provided' do
        test = User.find_all_except(@user1)

        expect(test).to include(@user2)
        expect(test).to include(@user3)
        expect(test).to_not include(@user1)
      end
    end
  end
end
