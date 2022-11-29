require 'rails_helper'

RSpec.describe MovieParty do
    describe 'validations' do
        it { should validate_presence_of(:movie_title) }
        it { should validate_presence_of(:duration) }
        it { should validate_presence_of(:start_time) }
        it { should validate_presence_of(:movie_id) }
     end

     describe 'relationships' do
        it { should have_many(:user_movie_parties) }
        it { should have_many(:users).through(:user_movie_parties) }
     end

     before(:each) do 
      @sean = User.create!(name: 'Sean', email: 'fake@gmail.com')
      date = DateTime.new(1991,3,13,12,0,0)
      @party = MovieParty.create!(movie_title: 'The Godfather', duration: 180, start_time: date, movie_id: 1)
      @user_movie_party = UserMovieParty.create!(user_id: @sean.id, movie_party_id: @party.id, status: 0)
     end

     describe 'instance methods' do 
      describe '#status' do 
         it 'returns status of user associated with the movie party' do 
            expect(@party.status(@sean)).to eq('hosting')
         end
      end
     end
end