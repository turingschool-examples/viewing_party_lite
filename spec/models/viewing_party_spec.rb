require 'rails_helper'

RSpec.describe ViewingParty do
  describe 'relationships' do
    it { should have_many(:user_viewing_parties) }
    it { should have_many(:users).through(:user_viewing_parties) }
  end

  describe 'instance methods' do
    before :each do
      stub_request(:get, "https://api.themoviedb.org/3/movie/550?api_key=#{ENV['api_key']}&language=en-US").
        to_return(status: 200, body: File.read('spec/fixtures/details_response.json'), headers: {})
      stub_request(:get, "https://api.themoviedb.org/3/movie/550/credits?api_key=#{ENV['api_key']}&language=en-US").      
        to_return(status: 200, body: File.read('spec/fixtures/cast_response.json'), headers: {})
      stub_request(:get, "https://api.themoviedb.org/3/movie/550/reviews?api_key=#{ENV['api_key']}&language=en-US").
        to_return(status: 200, body: File.read('spec/fixtures/reviews_response.json'), headers: {})

      @user_1 = User.create!(name: "John", email: "john@example.com")
      @user_2 = User.create!(name: "Bill", email: "nom@example.com")
      @user_3 = User.create!(name: "Bob", email: "nin@example.com")
      @movie = MovieFacade.all_movie_info(550)
  
      @vp = @user_1.viewing_parties.create!(movie_id: 550, duration: 139, start_day: Date.today, start_time: Time.now)
  
      UserViewingParty.create!(user_id: @user_2.id, viewing_party_id: @vp.id, status: 'Invited')
      UserViewingParty.create!(user_id: @user_3.id, viewing_party_id: @vp.id, status: 'Invited')
    end

    describe '.movie_info' do
      it 'returns the movie name and poster' do
        expect(@vp.movie_info[:title]).to eq("Fight Club")
        expect(@vp.movie_info[:poster]).to eq("/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg")
      end
    end
  
    describe '.invitees' do
      it 'returns a list of people invited to the party' do
        expect(@vp.invitees).to eq([@user_2, @user_3])
      end
    end

    describe '.host' do
      it 'returns the host of the party' do
        expect(@vp.host).to eq(@user_1)
      end
    end
  end
end