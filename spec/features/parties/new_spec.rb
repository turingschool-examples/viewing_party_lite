require "rails_helper"

describe "new party page" do
  describe "as a user" do
    describe "when i visit a new party page for some movie", :vcr do
      before do
        @user1 = User.create!(name: "Tony Soprano", email: "woke_up_this_morning@gmail.com")
        @user2 = User.create!(name: "Junior Soprano", email: "varsity_athlete@gmail.com")
        @user3 = User.create!(name: "Christopher Moltisanti", email: "the_hare_apparent@gmail.com")
        @user4 = User.create!(name: "Paulie Gualtieri", email: "watch_it_chrissie@gmail.com")
        @user5 = User.create!(name: "Bobby Baccalieri", email: "bobby_baccala@gmail.com")
        visit "/users/#{@user2.id}/movies/290/parties/new"
      end

      it "i see the name of the movie title", :vcr do
        expect(page).to have_content("Barton Fink")
      end

      it "and i see a form with fields for duration, date, start_time, and checkboxes for all existing users to be invited", :vcr do
        expect(page).to have_field("Duration", with: 117)
        expect(page).to have_field("Event Date")
        expect(page).to have_field("Start Time")
        expect(page).to have_field("Tony Soprano", checked: false)
        expect(page).to have_field("Junior Soprano", checked: false)
        expect(page).to have_field("Christopher Moltisanti", checked: false)
        expect(page).to have_field("Paulie Gualtieri", checked: false)
        expect(page).to have_field("Bobby Baccalieri", checked: false)
        expect(page).to have_button("Create Party")
      end

      it "i should not be able to create a party with a duration less than the runtime of the movie", :vcr do
        fill_in "Duration", with: 110

        expect(current_path).to eq("/users/#{@user2.id}/movies/290/parties/new")
        expect(page).to have_content("Invalid Data: Duration must be greater than or equal to the movie's runtime.")
      end

      it "should redirect the user to their dashboard after the party is created and the party is listed", :vcr do
        fill_in "Duration", with: 137
        fill_in "Event Date", with: Date.parse("26/04/26")
        fill_in "Start Time", with: Time.parse("08:00 PM")
        check "Tony Soprano"
        check "Junior Soprano"
        check "Bobby Baccalieri"
        click_button "Create Party"

        expect(current_path).to eq("/users/#{@user2.id}")

        within "#viewing_parties" do
          expect(page).to have_content("Tony Soprano")
          expect(page).to have_content("Bobby Baccalieri")
          expect(page).not_to have_content("Christopher Moltisanti")
          expect(page).to have_content("Paulie Gualtieri")
        end
      end

      it "the new party should also be listed on other user dashboards if they were invited" do
      end
    end
  end
end
