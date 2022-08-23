require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  describe 'validations' do
    # it { should validate_presence_of :movie_id }
    # it { should validate_presence_of :host_id }
    it { should validate_presence_of :duration }
    it { should validate_numericality_of :duration }
    it { should validate_presence_of :eventdate }
    # it { should validate_date :eventdate }
    it { should validate_presence_of :starttime }
    # it { should validate_time :starttime }
  end

  describe 'relationships' do
    it { should have_many(:user_viewing_parties) }
    it { should have_many(:users).through(:user_viewing_parties) }
  end

  before :each do
  end

  describe 'class methods' do
  end

  describe 'instance methods' do
  end
end
