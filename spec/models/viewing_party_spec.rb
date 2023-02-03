require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  describe 'associations' do
    it { should belong_to :user }
    it { should have_many :viewing_party_users }
    it { should have_many(:users).through(:viewing_party_users) }
  end

  describe 'validations' do
    it { should validate_presence_of :movie_id }
    it { should validate_numericality_of :movie_id }
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :poster_path }
    it { should validate_presence_of :title }
    it { should validate_presence_of :day }
    it { should validate_presence_of :start_time }
    it { should validate_presence_of :duration }
    it { should validate_numericality_of :duration }
  end
end