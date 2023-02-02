require 'rails_helper'

RSpec.describe "movies results page" do
  before(:each) do
    User.delete_all
    @user = create(:user)
    top_20_response = File.read('spec/fixtures/topmovies.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['MOVIE_DB_KEY']}")
      .to_return(status: 200, body: top_20_response)
    search_results = File.read('spec/fixtures/godfather_search.json')
    stub_request(:get, "https://api.themoviedb.org/3/search/movie?query=Godfather&api_key=#{ENV['MOVIE_DB_KEY']}")
      .to_return(status: 200, body: search_results)
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

  it 'displays the top 20 results for a search for Godfather' do
    visit "users/#{@user.id}/movies?search=Godfather"

    within "#search_results-1" do
      expect(page).to have_content("The Godfather")
      expect(page).to have_content("8.7")
      expect(page).to have_link("The Godfather")
    end

    within "#search_results-7" do
      expect(page).to have_content("Megalodon!: Great White Godfather")
      expect(page).to have_content("0")
      expect(page).to have_link("Megalodon!: Great White Godfather")
    end

    within "#search_results-19" do
      expect(page).to have_content("Francis and The Godfather")
      expect(page).to have_content("0")
      expect(page).to have_link("Francis and The Godfather")
      click_link("Francis and The Godfather")
      save_and_open_page
    end

  end



end