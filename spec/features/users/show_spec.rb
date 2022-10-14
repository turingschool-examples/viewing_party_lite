require 'rails_helper'

RSpec.describe 'User Dashboard Page' do
  describe "when I visit '/users/:id' where :id is a valid user, I should see" do
    it "has '<user's name>'s Dashboard' at the top of the page" do
      @user1 = User.create!(name: 'Erin', email: 'epintozzi@turing.edu')
      @user2 = User.create!(name: 'Mike', email: 'mike@turing.edu')
      @user3 = User.create!(name: 'Meg', email: 'mstang@turing.edu')

      visit user_path(@user1)

      expect(page).to have_content("Erin's Dashboard")
      expect(page).to_not have_content("Mike's Dashboard")
      expect(page).to_not have_content("Meg's Dashboard")
    end

    it 'has a button to Discover Movies' do
      @user1 = User.create!(name: 'Erin', email: 'epintozzi@turing.edu')
      visit user_path(@user1)

      expect(page).to have_button('Discover Movies')
    end

    it 'when I click the Discover Movies button, I am redirected to the discover page' do
      @user1 = User.create!(name: 'Erin', email: 'epintozzi@turing.edu')
      visit user_path(@user1)

      click_button 'Discover Movies'

      expect(current_path).to eq(user_discover_index_path(@user1))
    end

    describe 'Viewing Parties' do
      before :all do
        @movie_response = File.open('./fixtures/godfather_details.json')
        stub_request(:get, 'https://api.themoviedb.org/3/movie/238').
          with(query: {'api_key' => ENV['movie_api_key']}).
          to_return(status: 200, body: @movie_response)

        @image_response = File.open('./fixtures/godfather_image.json')
        stub_request(:get, 'https://api.themoviedb.org/3/movie/238/images').
          with(query: {'api_key' => ENV['movie_api_key']}).
          to_return(status: 200, body: @image_response) 

        json_response = File.open('./fixtures/top_20.json')
        stub_request(:get, 'https://api.themoviedb.org/3/movie/top_rated').
          with(query: {'api_key' => ENV['movie_api_key']}).
          to_return(status: 200, body: json_response)

      end

      it 'has a section that lists viewing parties' do
        user1 = User.create!(name: 'Erin', email: 'epintozzi@turing.edu')
        visit user_path(user1)

        expect(page).to have_css('#viewing_parties')
      end

      it 'I see a movie image with each movie' do
        user1 = User.create!(name: 'Erin', email: 'epintozzi@turing.edu')
        user2 = User.create!(name: 'Mike', email: 'mike@turing.edu')
        user3 = User.create!(name: 'Meg', email: 'mstang@turing.edu')

        # visit user_discover_index_path(user1)

        # click_button('Find Top Rated Movies')
        # save_and_open_page
        # expect(page).should have_css('img', text: "image1.jpg")
      end

      it 'I see the movie title for each movie, and it is a link to its movie show page' do

      end

      it 'I see the date and time of the event' do

      end

      describe 'I am invited to the event' do
        it 'I see who is hosting the event' do

        end

        it 'I see a list of users invited, with my name in bold' do

        end
      end

      describe 'I am the host of the event' do
        it 'I see that I am the host of the event' do

        end

        it 'I see a list of friends invited to the viewing party' do
          
        end
      end
    end 
  end
end
