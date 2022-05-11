require "rails_helper"

describe "movie show page" do
  describe "as a user" do
    describe "when i visit a movie show page" do
      before do
        @user1 = User.create!(name: "User One", email: "user1@test.com")
        visit "/users/#{@user1.id}/movies/290"
      end

      it "i see the movies title, vote average, runtime, genres, and summary", :vcr do
        expect(page).to have_content("Barton Fink")
        expect(page).to have_content("Vote Average: 7.5")
        expect(page).to have_content("Runtime: 1 Hour and 57 Minutes")

        within "#genres" do
          expect(page).to have_content("Comedy")
          expect(page).to have_content("Drama")
          expect(page).to have_content("Crime")
          expect(page).not_to have_content("Romance")
        end

        expect(page).to have_content("Summary: A renowned New York playwright is enticed to California to write for the movies and discovers the hellish truth of Hollywood.")
      end
    end
  end
end
