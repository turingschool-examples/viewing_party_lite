require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    # it { should validate_presence_of :movie_id }
    # it { should validate_presence_of :host_id }
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
  end

  describe 'relationships' do
    it { should have_many(:user_viewing_parties) }
    it { should have_many(:viewing_parties).through(:user_viewing_parties) }
  end

  before :each do
  end

  describe 'class methods' do
  end

  describe 'instance methods' do
  end
end
