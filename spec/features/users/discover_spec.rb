require 'rails_helper'

RSpec.describe "user discover page" do
  before(:all) do
    @user = create(:user)
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
      
      expect(current_path).to eq("/users/#{@user.id}/movies")
    end
  end

  it 'has a search field to find movies by name when redirected to the movies results page' do
    visit "/users/#{@user.id}/discover"

    within "#search_movies" do
      expect(page).to have_field :search
      expect(page).to have_button("Find Movies")

      click_button("Find Movies")
      expect(current_path).to eq("/users/#{@user.id}/movies")
    end
  end

  it 'works to find movies when a valid movie title is input in the search bar' do
    visit "/users/#{@user.id}/discover"

    within "#search_movies" do
      fill_in :search, with: "Toy Story"
      click_button("Find Movies")
      expect(current_path).to eq("/users/#{@user.id}/movies")
    end
  end

  



end