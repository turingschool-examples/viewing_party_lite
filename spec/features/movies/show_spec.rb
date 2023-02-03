require 'rails_helper'

RSpec.describe 'movie show page' do
  before :each do
    @user = User.create!(name: "John", email: "john@example.com")
  end

  it 'lists the first 10 cast members' do
    # stub_request(:get, "https://api.themoviedb.org/3/movie/550/credits?api_key=d15da2c6fe48d15a51f43f47b05c0ed1&language=en-US").      
    # to_return(status: 200, body: File.read('spec/fixtures/cast_response.json'), headers: {})
    WebMock.disable!
    visit user_movie_path(@user, 550)

    expect(page).to have_content("Edward Norton as The Narrator")
    expect(all('li').count).to eq(10)
  end

  it 'Displays all the movie details' do
    # stub_request(:get, "https://api.themoviedb.org/3/movie/550?api_key=#{ENV['api_key']}&language=en-US").
    #   to_return(status: 200, body: File.read('spec/fixtures/details_response.json'), headers: {})
    WebMock.disable!
    visit user_movie_path(@user, 550)

    expect(page).to have_content("Vote Average: 8.4")
    expect(page).to have_content("Runtime: 2 hr 19 min")
    expect(page).to have_content("Drama Thriller Comedy")
    expect(page).to have_content("A ticking-time-bomb")
    expect(page).to have_content('Goddard')
    expect(page).to have_content('Pretty awesome movie')
    expect(page).to have_content("8 Reviews")
  end


end