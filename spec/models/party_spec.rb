require 'rails_helper'
RSpec.describe Party, type: :model do
  describe 'relationships' do
    it { should have_many :user_parties }
    it { should have_many(:users).through(:user_parties) }
  end

  describe 'validations' do
    it { should validate_presence_of(:duration) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:start_time) }
  end

  before(:each) do
    # @instance_var = Something.create!(input)
  end

  describe 'class methods' do

  end

  describe 'instance methods' do
    describe '#movie' do
      it 'returns a movie object', :vcr do
        party = create(:party, movie_id: 550)
        expect(party.movie).to be_a Movie
      end
    end

    describe '#poster_path' do
      it 'returns the poster path of the movie the party is for', :vcr do
        party = create(:party, movie_id: 550)
        expect(party.poster_path).to be_a String
        movie = MovieFacade.movie_by_id(550)
        expect(party.poster_path).to eq(movie.poster_path)
      end
    end
  end

end