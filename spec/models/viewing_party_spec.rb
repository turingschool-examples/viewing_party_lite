require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  describe 'validations' do
    it { should validate_presence_of :movie_title }
    it { should validate_presence_of :movie_id }
    it { should validate_presence_of :host_id }
    it { should validate_presence_of :duration }
    it { should validate_numericality_of :duration }
    it { should validate_presence_of :date }
    it { should validate_presence_of :start_time }
    it { should validate_presence_of :poster_path }
  end

  describe 'relationships' do
    it { should belong_to(:host).class_name('User') }
    it { should have_many(:user_viewing_parties) }
    it { should have_many(:users).through(:user_viewing_parties) }
  end
end
