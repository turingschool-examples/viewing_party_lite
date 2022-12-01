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

  describe '#datetime_cannot_be_in_the_past' do
    @view_party_1 = ViewParty.new(movie_id: 1, movie_name: 'Toy Story', duration: 135, datetime: 'Thu, 01 Dec 1996 14:08:40 -0700')
    it { should_not be_valid}
  end
end
