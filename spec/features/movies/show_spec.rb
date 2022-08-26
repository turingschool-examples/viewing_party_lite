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
    expect(page).to have_content("Summary: Raj is a rich, carefree, 
                                  happy-go-lucky second generation NRI. 
                                  Simran is the daughter of Chaudhary Baldev Singh, who in spite of being an NRI 
                                  is very strict about adherence to Indian values. 
                                  Simran has left for India to be married to her childhood fiancé. 
                                  Raj leaves for India with a mission at his hands, 
                                  to claim his lady love under the noses of her whole family. 
                                  Thus begins a saga.")
    # expect(page).to have_content("Cast: ")
    # expect(page).to have_content("Total Reviews: ")
    end
  end