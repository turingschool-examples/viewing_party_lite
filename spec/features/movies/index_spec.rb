require "rails_helper"

RSpec.describe "Movies Index" do
  before :each do
    @user = User.create!(name: "John", email: "john@example.com")
  end
  # d15da2c6fe48d15a51f43f47b05c0ed1
  it 'has a link to return to discover page' do
    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['api_key']}&language=en-US&page=1").
      to_return(status: 200, body: File.read('spec/fixtures/top_movies_response.json'), headers: {})
    visit user_movies_path(@user)

    expect(page).to have_button 'Discover Page'

    click_button 'Discover Page'
    
    expect(current_path).to eq(user_discover_index_path(@user))
  end

  it 'Returns the top 20 movies' do
    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['api_key']}&language=en-US&page=1").
      to_return(status: 200, body: File.read('spec/fixtures/top_movies_response.json'), headers: {})
    visit user_discover_index_path(@user)
    click_on "Find Top Rated Movies"

    expect(current_path).to eq(user_movies_path(@user))
    expect(page).to have_content("The Godfather | Vote Average: 8.7")
    expect(page).to have_link('The Godfather', href: user_movie_path(@user, 238))
    expect(page).to have_content("Gabriel's Inferno: Part II | Vote Average: 8.5")
    expect(page).to have_link("Gabriel's Inferno: Part II", href: user_movie_path(@user, 724089))
    expect(all('li').count).to eq(20)
  end

  it 'returns movies using search api' do
    stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=d15da2c6fe48d15a51f43f47b05c0ed1&language=en-US&query=fast&page=1&include_adult=false").
      to_return(status: 200, body: File.read('spec/fixtures/search_response.json'), headers: {})
    visit user_discover_index_path(@user)
    fill_in :keyword, with: "fast"
    click_on 'Find Movies'

    expect(current_path).to eq(user_movies_path(@user))
    expect(page).to have_content("Fast X | Vote Average: 0")
    expect(page).to have_link("Fast X", href: user_movie_path(@user, 385687))
    expect(page).to have_content("Fast Track: No Limits | Vote Average: 6")
    expect(page).to have_link("Fast Track: No Limits", href: user_movie_path(@user, 17143))
    expect(all('li').count).to eq(20)
  end
end