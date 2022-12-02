# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ViewParty, type: :model do
  describe 'relationships' do
    it { should have_many(:user_view_parties) }
    it { should have_many(:users).through(:user_view_parties) }
  end

  describe 'validations' do
    it { should validate_presence_of(:movie_id) }
    it { should validate_presence_of(:movie_name) }
    it { should validate_presence_of(:duration) }
    it { should validate_presence_of(:datetime) }
  end


  describe 'instance methods' do
    describe '#datetime_cannot_be_in_the_past' do
      view_party_1 = ViewParty.new(movie_id: 1, movie_name: 'Toy Story', duration: 135, datetime: 'Thu, 01 Dec 1996 14:08:40 -0700')
      it { should_not be_valid }
    end

    before(:each) do
        @user_1 = create(:user)
        @user_2 = create(:user)
        @view_party = create(:view_party, movie_id: 550)
        @user_view_party = create(:user_view_party, user: @user_1, view_party: @view_party, host: true)
        @user_view_party = create(:user_view_party, user: @user_2, view_party: @view_party, host: false)
    end

    describe '#file_path' do
      it 'returns the poster URI for that view party', :vcr do
        expect(@view_party.file_path).to eq('/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg')
      end
    end

    describe '#host?' do
      it 'returns true if the given user is the party host' do
        expect(@view_party.host?(@user_1)).to be(true)
        expect(@view_party.host?(@user_2)).to be(false)
      end

    end

    describe '#members' do
      it 'returns an array of user objects for members attending that view party' do
        expect(@view_party.members.to_a).to eq([@user_1, @user_2])
      end
    end
  end
end
