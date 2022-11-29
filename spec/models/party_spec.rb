require 'rails_helper'

RSpec.describe Party, type: :model do
  describe 'relationships' do
    it { should have_many :user_parties }
    it { should have_many(:users).through(:user_parties) }
  end

  describe 'validations' do
    it { should validate_numericality_of :duration }
    it { should validate_numericality_of :day }
    it { should validate_numericality_of :start_time }
    it { should validate_presence_of :movie_title }
  end
end