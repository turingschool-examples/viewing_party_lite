require 'rails_helper'

RSpec.describe "The Movie Details Page" do
  before :each do
    @user = User.create!(name: "John Cena", email: "johnc@email.com")
    json_response1 = File.read('spec/fixtures/fight_club_details.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/550?api_key=5b03ee47af6e087159e9baca0f110161").to_return(status: 200, body: json_response1, headers: {})
    
    json_response2 = File.read('spec/fixtures/fight_club_cast.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/550/credits?api_key=5b03ee47af6e087159e9baca0f110161&language=en-US").to_return(status: 200, body: json_response2, headers: {})
      
    json_response3 = File.read('spec/fixtures/fight_club_reviews.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/550/reviews?api_key=5b03ee47af6e087159e9baca0f110161&language=en-US&page=1").to_return(status: 200, body: json_response3, headers: {})

    visit user_movie_path(@user, 550)
  end

  it 'contains the movie info, cast, and reviews' do
    expect(page).to have_content("Title: Fight Club")
    expect(page).to have_content("Vote Average: 8.432")
    expect(page).to have_content("Runtime: 139")
    expect(page).to have_content("Genres: Drama, Thriller, Comedy")
    expect(page).to have_content("Summary: A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.")
    expect(page).to have_content("Cast:")
    expect(page).to have_content("Edward Norton as The Narrator")
    expect(page).to have_content("David Andrews as Thomas")
    expect(page).to have_content("Total Reviews: 8")
    expect(page).to have_content("Goddard's Review: Pretty awesome movie.  It shows what one crazy person can convince other crazy people to do.  Everyone needs something to believe in.  I recommend Jesus Christ, but they want Tyler Durden.")
    expect(page).to have_content("Katch22's Review: Madness unbounded.  Don't try to make sense of insanity, just ride a wild ride.")
  end

  it 'has a button to create a viewing party' do
    expect(page).to have_button("Create Viewing Party")
  end

  it 'has a button to return to the discover page' do
    expect(page).to have_link("Return to Discover Page", href: user_discover_index_path(@user))
  end
end