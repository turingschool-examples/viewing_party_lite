require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  describe 'validations' do
    it { should validate_presence_of :host }
    it { should validate_presence_of :duration }
    it { should validate_numericality_of :duration }
    it { should validate_presence_of :movie_id }
    it { should validate_numericality_of  :movie_id }
    it { should validate_presence_of :image_path }
    it { should validate_presence_of :movie_title }
    it { should validate_presence_of :start_time }
  end

  describe 'relationships' do
    
  end
end