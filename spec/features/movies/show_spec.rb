require 'rails_helper'
RSpec.describe "Movie Detail Page" do 
  it 'has movie details', :vcr do 
    @user1 = User.create!(name: "Micheal Jordan", email: "user1@gmail.com")

    visit "/users/#{@user1.id}/movies/19404"
    
    expect(page).to have_content("Dilwale Dulhania Le Jayenge")
    expect(page).to have_content("Vote Average: 8.7")
    expect(page).to have_content("Comedy")
    expect(page).to have_content("Drama")
    expect(page).to have_content("Romance")
    expect(page).to have_content("Runtime: 3 hours and 10 minutes")
    expect(page).to have_content("Summary: Raj is a rich, carefree, happy-go-lucky second generation NRI. Simran is the daughter of Chaudhary Baldev Singh, who in spite of being an NRI is very strict about adherence to Indian values. Simran has left for India to be married to her childhood fiancé. Raj leaves for India with a mission at his hands, to claim his lady love under the noses of her whole family. Thus begins a saga")
    expect(page).to have_content("Cast Members: Shah Rukh Khan")
    # expect(page).to have_content("Total Reviews: ")
    end
  it 'has button to create viewing party/redirects to new form', :vcr do 
    @user1 = User.create!(name: "Micheal Jordan", email: "user1@gmail.com")

    visit "/users/#{@user1.id}/movies/19404"
    expect(page).to have_button("Create Viewing Party")

    click_on "Create Viewing Party"
    expect(current_path).to eq("/users/#{@user1.id}/movies/19404/viewing_party/new")
    end
  
    it 'has button to return to discover page', :vcr do 
    @user1 = User.create!(name: "Micheal Jordan", email: "user1@gmail.com")

    visit "/users/#{@user1.id}/movies/19404"
    
    expect(page).to have_button("Discover Movies")
    end
  end
#   When I visit a movie's detail page (/users/:user_id/movies/:movie_id where :id is a valid user id,
# I should see

#  Details This viewing party button should take the user to the new viewing party page (/users/:user_id/movies/:movie_id/viewing-party/new)
# And I should see the following information about the movie:

# done Movie Title
# done Vote Average of the movie
#  doneRuntime in hours & minutes
# done Genre(s) associated to movie
#  doneSummary description
#  List the first 10 cast members (characters&actress/actors)
#  Count of total reviews
#  Each review's author and information
# Details: This information should come from 3 different endpoints from The Movie DB API