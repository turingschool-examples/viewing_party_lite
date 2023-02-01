require 'rails_helper'

RSpec.describe "movies results page" do
  before(:each) do
    User.delete_all
    @user = create(:user)
    top_20_response = File.read('spec/fixtures/topmovies.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.7.4'
           }).
         to_return(status: 200, body: top_20_response, headers: {})
  end

  it 'has the site title at the top of the page' do
    visit "users/#{@user.id}/movies"

    expect(page).to have_content("Viewing Party")
  end

  it 'has a link back to the discover page' do
    visit "users/#{@user.id}/movies"

    expect(page).to have_button("Discover Page")
    click_button("Discover Page")
    expect(current_path).to eq("/users/#{@user.id}/discover")
  end

  it 'displays the top 20 rated movies and their average rating' do
    visit "users/#{@user.id}/movies?q=top%20rated"

    within "#top_rated-1" do
      expect(page).to have_content("The Godfather")
      expect(page).to have_content("8.7")
    end

    within "#top_rated-5" do
      expect(page).to have_content("Schindler's List")
      expect(page).to have_content("8.6")
    end

    within "#top_rated-20" do
      expect(page).to have_content("Teen Wolf: The Movie")
      expect(page).to have_content("8.5")
    end

  end



end