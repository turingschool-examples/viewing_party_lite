require 'rails_helper'

RSpec.describe 'Discover movies page' do
  describe "When I visit /users/:id/discover" do

    before(:each) do
      @user_1 = create(:user)
      visit login_path
      fill_in(:email, with: "#{@user_1.email}")
      fill_in(:password, with: "#{@user_1.password}")
      click_on("Login")
      click_on("Discover Movies")
    end

    it 'I should see a button to Discover Top Rated Movies' do
      expect(page).to have_button('Top Rated Movies')
    end

    it 'I see a text field to enter keywords to search by title' do
      expect(page).to have_field('Search by Movie Title')
      expect(page).to have_button('Search by Movie Title')
    end

    describe 'happy path' do
      it 'When I search for a movie I am taken to the Movie Results Page', :vcr do
        # json_response = File.read("spec/fixtures/movies_query_data.json")
        # stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['movies_api_key']}&query=fight").to_return(status: 200, body: json_response)

        fill_in('Search by Movie Title', with: 'fight')
        click_button('Search by Movie Title')
        expect(current_path).to eq(users_movies_path)
        expect(page).to have_content('Average Votes:')
        expect(page).to have_link('Fight Club')
        expect(page).to have_button('Discover Movies')
      end

      it 'When I click top rated movies I see the current top 20 movies', :vcr do
        click_button('Top Rated Movies')
        expect(current_path).to eq(users_movies_path)
        expect(page).to have_link('Godfather')
        expect(page).to_not have_link('Matilda')
      end
    end

    describe 'sad path' do
      it 'When I fill in nothing and click Search by Movie Title I recieve an error message', :vcr do
        click_button('Search by Movie Title')
        expect(current_path).to eq(users_movies_path)
        expect(page).to have_content('You must fill in a title.')
      end
    end
  end
end

