require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  describe 'relationships' do
    it { should have_many :user_parties }
    it { should have_many(:users).through(:user_parties) }
  end

  describe 'validations' do
    it { should validate_presence_of :movie_id }
    it { should validate_presence_of :duration }
    it { should validate_presence_of :date }
    it { should validate_presence_of :start_time }
  end

  describe 'instance_methods' do 
    describe '.movie_data' do 
      it 'returns movie data by id from api', :vcr do 
        vp1 = ViewingParty.create!(movie_id: 111, duration: 151, date: Time.new(2022, 04, 12, 21, 00),
                            start_time: Time.new(2022, 04, 12, 21, 00, 00, "-06:00"))            
        scarface = vp1.movie_data
        expect(scarface.title).to eq("Scarface")
        expect(scarface.runtime).to eq(170)
        expect(scarface.id).to eq(111)
        expect(scarface.vote_average).to eq(8.2)

      end
    end
  end
end
