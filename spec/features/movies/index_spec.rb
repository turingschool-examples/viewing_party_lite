require "rails_helper"

RSpec.describe "Movies Index" do
  before :each do
    @user = User.create!(name: "John", email: "john@example.com")
    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=d15da2c6fe48d15a51f43f47b05c0ed1&language=en-US&page=1").
    to_return(status: 200, body: File.read('spec/fixtures/top_movies_response.json'), headers: {})
  end

  it 'Returns the top 20 movies' do
    visit user_discover_index_path(@user)
    click_on "Find Top Rated Movies"

    expect(current_path).to eq (user_movies_path(@user))
    expect(page).to have_content("The Godfather")
    expect(all('li').count).to eq(20)
  end
end