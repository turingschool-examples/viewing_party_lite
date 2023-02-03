require 'rails_helper'

RSpec.describe User do
  describe 'relationships' do
    it { should have_many(:user_viewing_parties) }
    it { should have_many(:viewing_parties).through(:user_viewing_parties) }
  end

  describe 'validations' do
    it { should validate_uniqueness_of(:email) }
  end

  describe 'instance methods' do
    before :each do
      stub_request(:get, "https://api.themoviedb.org/3/movie/550?api_key=#{ENV['api_key']}&language=en-US").
      to_return(status: 200, body: File.read('spec/fixtures/details_response.json'), headers: {})
      stub_request(:get, "https://api.themoviedb.org/3/movie/550/credits?api_key=#{ENV['api_key']}&language=en-US").      
        to_return(status: 200, body: File.read('spec/fixtures/cast_response.json'), headers: {})
      stub_request(:get, "https://api.themoviedb.org/3/movie/550/reviews?api_key=#{ENV['api_key']}&language=en-US").
        to_return(status: 200, body: File.read('spec/fixtures/reviews_response.json'), headers: {})

      stub_request(:get, "https://api.themoviedb.org/3/movie/238?api_key=#{ENV['api_key']}&language=en-US").
      to_return(status: 200, body: File.read('spec/fixtures/details_response.json'), headers: {})
      stub_request(:get, "https://api.themoviedb.org/3/movie/238/credits?api_key=#{ENV['api_key']}&language=en-US").      
        to_return(status: 200, body: File.read('spec/fixtures/cast_response.json'), headers: {})
      stub_request(:get, "https://api.themoviedb.org/3/movie/238/reviews?api_key=#{ENV['api_key']}&language=en-US").
        to_return(status: 200, body: File.read('spec/fixtures/reviews_response.json'), headers: {})
  
      @user_1 = User.create!(name: "John", email: "john@example.com")
      @user_2 = User.create!(name: "Bill", email: "nom@example.com")
      @user_3 = User.create!(name: "Bob", email: "nin@example.com")
      @movie_1 = MovieFacade.all_movie_info(550)
      @movie_2 = MovieFacade.all_movie_info(238)

      @vp_1 = @user_1.viewing_parties.create!(movie_id: 550, duration: 139, start_day: Date.today, start_time: Time.now)
      @vp_2 = @user_2.viewing_parties.create!(movie_id: 238, duration: 139, start_day: Date.today, start_time: Time.now)

      UserViewingParty.create!(user_id: @user_2.id, viewing_party_id: @vp_1.id, status: 'Invited')
      UserViewingParty.create!(user_id: @user_3.id, viewing_party_id: @vp_1.id, status: 'Invited')
      UserViewingParty.create!(user_id: @user_1.id, viewing_party_id: @vp_2.id, status: 'Invited')
    end

    describe '.hosting' do
      it 'returns viewing parties the user is hosting' do
        expect(@user_1.hosting).to eq([@vp_1])
      end
    end

    describe '.invited_to' do
      it 'returns viewing parties the user has been invited to' do
        expect(@user_1.invited_to).to eq([@vp_2])
      end
    end
  end
end