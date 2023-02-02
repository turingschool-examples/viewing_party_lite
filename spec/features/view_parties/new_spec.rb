require 'rails_helper'

RSpec.describe 'new view party page' do
  before(:each) do
    User.delete_all

    @user = create(:user)

    json_response = File.read('spec/fixtures/movie.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/238?api_key=#{ENV['MOVIE_DB_KEY']}")
      .to_return(status: 200, body: json_response, headers: {})

    @movie_detail = MovieDetail.new(JSON.parse(json_response, symbolize_names: true))

    visit new_user_movie_viewing_party_path(@user.id, @movie_detail.id)
  end

  it 'displays the site title and page title at the top' do
    expect(page).to have_content("Viewing Party")
    expect(page).to have_content("Create a Movie Party for '#{@movie_detail.title}'")
  end

  it 'has a link to return to the discover page' do
    expect(page).to have_button("Discover Page")
    click_button("Discover Page")
    expect(current_path).to eq("/users/#{@user.id}/discover")
  end


end