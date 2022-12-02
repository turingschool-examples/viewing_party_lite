require 'rails_helper'

RSpec.describe 'Movies Show Page' do
  before(:each) do
    @user = User.create!(name: Faker::Name.unique.name, email: Faker::Internet.unique.free_email)

    json_response = File.read('spec/fixtures/godfather_movie.json')
    stub_request(:get, 'https://api.themoviedb.org/3/movie/238?api_key=0c4fca0a6457377ef48a02ec2df80f2f&language=en-US').to_return(status: 200, body: json_response)
    visit user_movie_path(@user.id, 238)
  end

  describe 'Movies#show' do

    it 'has a button back to Discover Movies' do
      expect(page).to have_link('Discover Movies')
      click_link 'Discover Movies'
      expect(current_path).to eq("/users/#{@user.id}/discover")
    end

    xit 'has a button to Create Viewing Party' do
      expect(page).to have_link('Create Viewing Party')
      click_link 'Create Viewing Party'
      expect(current_path).to eq("/users/#{:user_id}/movies/#{:movie_id}/viewing-party/new")
    end


    it 'has details for the movie on display' do
      expect(page).to have_content('The Godfather')
      expect(page).to have_content('Average vote:')
    end
  end
end
