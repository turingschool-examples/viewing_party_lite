require "rails_helper"

describe "movie show page" do
  describe "as a user" do
    describe "when i visit a movie show page" do
      before do
        @user1 = User.create!(name: "User One", email: "user1@test.com", password: "test123", password_confirmation: "test123")
        visit "/login"
        fill_in "Email", with: @user1.email.to_s
        fill_in "Password", with: @user1.password.to_s
        click_button "Log In"
        visit "/movies/290"
      end

      it "i see a button to create a viewing party", :vcr do
        click_button "Create Viewing Party"

        expect(current_path).to eq("/movies/290/parties/new")
      end

      it "i see a button to return to the discover page", :vcr do
        click_button "Return to Discover Page"

        expect(current_path).to eq("/discover")
      end

      it "i see the movies title, vote average, runtime, genres, and summary", :vcr do
        expect(page).to have_content("Barton Fink")
        expect(page).to have_content("Vote Average: 7.5")
        expect(page).to have_content("Runtime: 1 Hour(s) and 57 Minutes")

        within "#genres" do
          expect(page).to have_content("Comedy")
          expect(page).to have_content("Drama")
          expect(page).to have_content("Crime")
          expect(page).not_to have_content("Romance")
        end

        expect(page).to have_content("A renowned New York playwright is enticed to California to write for the movies and discovers the hellish truth of Hollywood.")
      end

      it "i see the first 10 members of the movies cast", :vcr do
        within "#cast" do
          expect(page).to have_content("John Turturro")
          expect(page).to have_content("Barton Fink")
          expect(page).to have_content("Richard Portnow")
          expect(page).to have_content("Det. Mastrionotti")
          expect(page).not_to have_content("Christopher Murney")
          expect(page).not_to have_content("Det. Deutsch")
        end
      end

      it "i see all the reviews, their authors, and a count of the reviews", :vcr do
        visit "/movies/100"
        within "#reviews" do
          expect(page).to have_content("Author: BradFlix")
          expect(page).to have_content("Review: I just plain love this movie!")
          expect(page).to have_content("Author: Andres Gomez")
          expect(page).to have_content("Review: Far from being a good movie, with tons of flaws but already pointing to the pattern of the whole Ritchie's filmography.")
          expect(page).to have_content("Number of Reviews: 4")
        end
      end
    end
  end

  describe "as a visitor" do
    describe "when i visit the movies show page" do
      it "if i click the button to create a viewing party, i am redirected to the show page with an error message", :vcr do
        visit "/movies/100"

        click_button "Create Viewing Party"

        expect(current_path).to eq("/movies/100")
        expect(page).to have_content("You must be logged in to access the Dashboard.")
      end
    end
  end
end
