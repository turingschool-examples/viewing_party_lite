require 'rails_helper'

RSpec.describe "user discover page" do
  before(:all) do
    @user = create(:user)
    top_20_response = File.read('spec/fixtures/topmovies.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated")
      .with(headers: {'api_key' => 'd228687bb8c720542a46185488f1283c'})
      .to_return(status: 200, body: top_20_response)
  end

  it 'displays the page title' do
    visit "/users/#{@user.id}/discover"

    expect(page).to have_content("Viewing Party")
    expect(page).to have_content("Discover Movies")
  end

  it 'has a button to redirect to the movies results page with the top 20 rated movies displayed' do
    visit "/users/#{@user.id}/discover"

    within "#top_rated" do
      expect(page).to have_button("Find Top Rated Movies")
      click_button("Find Top Rated Movies")
      expect(current_path).to eq("/users/#{@user.id}/movies?q=top%20rated")
    end
  end



end