require 'rails_helper'

RSpec.describe 'New Viewing Party Page' do
  before :each do
    @user = create(:user)
    @guest1,@guest2,@guest3 = create_list(:user, 3)
    string = File.read('./spec/fixtures/godfather_details.json')
    data = JSON.parse(string, symbolize_names: true)
    @movie = Movie.new(data)
    VCR.use_cassette("movie_details") do
      visit new_user_movie_viewing_party_path(@user, @movie.id)
    end
  end

  it 'displays the name of the movie title' do
    expect(page).to have_content("Create a Movie Party for #{@movie.title}")
  end

  it 'displays a button to the Discover Page' do
    expect(page).to have_button('Discover Page')

    click_button("Discover Page")

    expect(current_path).to eq(user_discover_index_path(@user))
  end
  
  describe 'new viewing party form' do
    it 'has fields' do
      save_and_open_page
      # require 'pry'; binding.pry
      within "#new-party-form" do
        expect(page).to have_content("Movie Title\n#{@movie.title}")
        expect(page).to have_field('Duration of Party', with: @movie.runtime)
        expect(page).to have_field("Day", with: Date.today)
        expect(page).to have_field("Start Time", with: Time.now)
        expect(page).to have_button("Create Party")
      end
    end

    it 'accepts field input to make viewing party' do
      fill_in('Duration of Party', with: (@movie.runtime + 5))
      fill_in('Day', with: Date.tomorrow)
      fill_in('Start Time', with: Time.now)

      click_button("Create Party")

      expect(current_path).to eq(user_path(@user))
    end
    
    it 'sad path' do
      fill_in('Duration of Party', with: (@movie.runtime - 5))
      fill_in('Day', with: Date.yesterday)
      fill_in('Start Time', with: Time.now)
  
      VCR.use_cassette("movie_details") do
        click_button("Create Party")
        expect(page).to have_button("Create Party")
      end
    end
  end
end