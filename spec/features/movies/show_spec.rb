require 'rails_helper'

RSpec.describe 'movie show page' do
  before :each do
    stub_request(:get, "https://api.themoviedb.org/3/movie/550?api_key=#{ENV['api_key']}&language=en-US").
      to_return(status: 200, body: File.read('spec/fixtures/details_response.json'), headers: {})
    stub_request(:get, "https://api.themoviedb.org/3/movie/550/credits?api_key=#{ENV['api_key']}&language=en-US").      
      to_return(status: 200, body: File.read('spec/fixtures/cast_response.json'), headers: {})
    stub_request(:get, "https://api.themoviedb.org/3/movie/550/reviews?api_key=#{ENV['api_key']}&language=en-US").
      to_return(status: 200, body: File.read('spec/fixtures/reviews_response.json'), headers: {})
    @user = User.create!(name: "John", email: "john@example.com")
  end

  it 'lists the first 10 cast members' do
    visit user_movie_path(@user, 550)
    # save_and_open_page

    expect(page).to have_content("Edward Norton as The Narrator")
    expect(all('li').count).to eq(10)
  end

  it 'Displays all the movie details' do
    visit user_movie_path(@user, 550)

    expect(page).to have_content("Vote Average: 8.4")
    expect(page).to have_content("Runtime: 2 hr 19 min")
    expect(page).to have_content("Drama Thriller Comedy")
    expect(page).to have_content("A ticking-time-bomb")
    expect(page).to have_content('Goddard')
    expect(page).to have_content('Pretty awesome movie')
    expect(page).to have_content("8 Reviews")
  end

  it 'has button to return to discover page' do
    visit user_movie_path(@user, 550)

    expect(page).to have_button('Discover Page')
    click_button 'Discover Page'
    expect(current_path).to eq(user_discover_index_path(@user))
  end

  it 'has button to create new viewing party' do
    visit user_movie_path(@user, 550)

    expect(page).to have_button('Create Viewing Party for Fight Club')
    click_button 'Create Viewing Party for Fight Club'
    expect(current_path).to eq(new_user_movie_viewing_party_path(@user, 550))
  end
end