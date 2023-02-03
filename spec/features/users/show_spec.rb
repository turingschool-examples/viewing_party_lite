require 'rails_helper'

RSpec.describe "user show page" do 
  before(:all) do
    User.delete_all
    @user = create(:user)
    # @viewing_party_1 = create(:viewing_party)
    # @viewing_party_2 = create(:viewing_party)
    # @viewing_party_user_1 = ViewingPartyUser.create!(user_id: @user.id, viewing_party_id: @viewing_party_1.id, host: true)
    # require 'pry'; binding.pry
    # @viewing_party_user_2 = ViewingPartyUser.create!(user_id: @user.id, viewing_party_id: @viewing_party_2.id, host: false)

    json_response = File.read('spec/fixtures/movie.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/238?api_key=#{ENV['MOVIE_DB_KEY']}")
      .to_return(status: 200, body: json_response, headers: {})

    @movie_detail = MovieDetail.new(JSON.parse(json_response, symbolize_names: true))
  end
  
  it 'displays the site and page title' do
    visit user_path(@user.id)

    expect(page).to have_content("Viewing Party")
    expect(page).to have_content("#{@user.name}'s Dashboard")
  end
  
  it 'has a button to link to the discover movies page' do
    visit user_path(@user.id)
    
    within "#discover_link" do
      expect(page).to have_button "Discover Movies"
      expect(page).to_not have_content('My Viewing Parties')
      click_button "Discover Movies"
      expect(current_path).to eq("/users/#{@user.id}/discover")
    end
  end
  
  it 'has a section for viewing parties' do
    visit user_path(@user.id)
    
    within("#viewing_parties") do
      expect(page).to have_content('My Viewing Parties')
      expect(page).to_not have_content('Discover Movies')
    end
  end
  
  xit 'displays the movie image in the viewing parties section' do
    image_json = fixture_file_upload('/file/photo.json', 'application/json')
    visit user_path(@user.id)

    within("#viewing_parties") do

      expect(page).to have_xpath("/tmU7GeKVybMWFButWEGl2M4GeiP.jpg")
      save_and_open_page
    end
  end
  
  xit 'displays the movie title as a link' do
    visit user_path(@user.id)
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