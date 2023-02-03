require 'rails_helper'

RSpec.describe "user show page" do 
  before(:all) do
    ViewingPartyUser.delete_all
    ViewingParty.delete_all
    User.delete_all

    json_response = File.read('spec/fixtures/movie.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/238?api_key=#{ENV['MOVIE_DB_KEY']}")
      .to_return(status: 200, body: json_response, headers: {})
    
    json_response_2 = File.read('spec/fixtures/shawshank.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/278?api_key=#{ENV['MOVIE_DB_KEY']}")
      .to_return(status: 200, body: json_response_2, headers: {})
    
    @user_1 = create(:user)
    @user_2 = create(:user)
    @movie_detail = MovieDetail.new(JSON.parse(json_response, symbolize_names: true))
    @movie_detail_2 = MovieDetail.new(JSON.parse(json_response_2, symbolize_names: true))
    @viewing_party_1 = ViewingParty.create!(duration: '180', host_id: @user_1.id, movie_id: @movie_detail.id, party_date: Date.today, party_time: Time.now)
    @viewing_party_2 = ViewingParty.create!(duration: '200', host_id: @user_2.id, movie_id: @movie_detail_2.id, party_date: Date.today-1, party_time: Time.now)
    @viewing_party_user_1 = ViewingPartyUser.create!(user_id: @user_1.id, viewing_party_id: @viewing_party_1.id)
    @viewing_party_user_2 = ViewingPartyUser.create!(user_id: @user_1.id, viewing_party_id: @viewing_party_2.id)

  end
  
  it 'displays the site and page title' do
    visit user_path(@user_1.id)

    expect(page).to have_content("Viewing Party")
    expect(page).to have_content("#{@user_1.name}'s Dashboard")
  end
  
  it 'has a button to link to the discover movies page' do
    visit user_path(@user_1.id)
    
    within "#discover_link" do
      expect(page).to have_button "Discover Movies"
      expect(page).to_not have_content('My Viewing Parties')
      click_button "Discover Movies"
      expect(current_path).to eq("/users/#{@user_1.id}/discover")
    end
  end
  
  it 'has a section for viewing parties' do
    visit user_path(@user_1.id)
    
    within("#viewing_parties") do
      expect(page).to have_content('My Viewing Parties')
      expect(page).to_not have_content('Discover Movies')
    end
  end
  
  xit 'displays the movie image in the viewing parties section' do
    visit user_path(@user_1.id)

    within("#viewing_parties") do
      expect(page).to find("/tmU7GeKVybMWFButWEGl2M4GeiP.jpg")
      save_and_open_page
    end
  end
  
  xit 'displays the movie title as a link' do
    visit user_path(@user_1.id)
    movie = @movie_detail.id
    require 'pry'; binding.pry
    
    within("#viewing_parties") do
      expect(page).to have_link("#{@movie_detail.title}") 
      require 'pry'; binding.pry
    end
  end
  
  xit 'displays the viewing party information' do
    visit user_path(@user.id)

    within("#viewing_parties") do
      expect(page).to have_content(@viewing_party_1.title)
      require 'pry'; binding.pry
    end
  end
end