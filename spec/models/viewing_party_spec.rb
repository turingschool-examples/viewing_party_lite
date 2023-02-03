require 'rails_helper'

RSpec.describe ViewingParty do
  describe 'relationships' do
    it { should have_many(:users).through(:viewing_party_users) }
    it { should have_many(:viewing_party_users) }
  end
  
  describe 'validations' do
    it { should validate_presence_of :duration }
    it { should validate_presence_of :party_date }
    it { should validate_presence_of :party_time }
    it { should validate_presence_of :host_id }
  end

  before(:each) do
    ViewingPartyUser.delete_all
    ViewingParty.delete_all
    User.delete_all

    json_response = File.read('spec/fixtures/movie.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/238?api_key=#{ENV['MOVIE_DB_KEY']}")
      .to_return(status: 200, body: json_response, headers: {})
    
    @user_1 = create(:user)
    @movie_detail = MovieDetail.new(JSON.parse(json_response, symbolize_names: true))
    @viewing_party_1 = ViewingParty.create!(duration: '180', host_id: @user_1.id, movie_id: @movie_detail.id, party_date: Date.today, party_time: "17:00")
    @viewing_party_user_1 = ViewingPartyUser.create!(user_id: @user_1.id, viewing_party_id: @viewing_party_1.id)
  end

  it 'has a method to find all the display data for the dashboard' do
    expect(@viewing_party_1.collect_display_data).to match({:attendees => [@user_1],
       :date => Date.parse("Fri, 03 Feb 2023"),
       :duration => "180",
       :host => "#{@user_1.name}",
       :image => "https://image.tmdb.org/t/p/w500//tmU7GeKVybMWFButWEGl2M4GeiP.jpg",
       :movie_id => 238,
       :time => Time.parse("2000-01-01 17:00:00.000000000 +0000"),
       :title => "The Godfather"})

  end
end