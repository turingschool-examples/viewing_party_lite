require "rails_helper"

describe "new party page" do
  describe "as a user" do
    describe "when i visit a new party page for some movie", :vcr do
      before do
        @user1 = User.create!(name: "Tony Soprano", email: "woke_up_this_morning@gmail.com", password: "test123", password_confirmation: "test123")
        @user2 = User.create!(name: "Junior Soprano", email: "varsity_athlete@gmail.com", password: "test123", password_confirmation: "test123")
        @user3 = User.create!(name: "Christopher Moltisanti", email: "the_hare_apparent@gmail.com", password: "test123", password_confirmation: "test123")
        @user4 = User.create!(name: "Paulie Gualtieri", email: "watch_it_chrissie@gmail.com", password: "test123", password_confirmation: "test123")
        @user5 = User.create!(name: "Bobby Baccalieri", email: "bobby_baccala@gmail.com", password: "test123", password_confirmation: "test123")
        visit "/users/#{@user2.id}/movies/290/parties/new"
      end

      it "i see the name of the movie title", :vcr do
        expect(page).to have_content("Barton Fink")
      end

      it "i should not be able to create a party with a duration less than the runtime of the movie", :vcr do
        fill_in "Duration", with: 110
        select "April", from: "_event_date_2i"
        select "26", from: "_event_date_3i"
        select "2026", from: "_event_date_1i"
        select "20", from: "_start_time_4i"
        select "00", from: "_start_time_5i"
        find(:css, "#invited_users_[value=#{@user1.id}]").set(true)
        find(:css, "#invited_users_[value=#{@user5.id}]").set(true)
        click_button "Create Party"

        expect(current_path).to eq("/users/#{@user2.id}/movies/290/parties/new")
        expect(page).to have_content("Invalid Data: Duration must be greater than or equal to the movie's runtime.")
      end

      it "should redirect the user to their dashboard after the party is created and the party is listed", :vcr do
        fill_in "Duration", with: 137
        select "April", from: "_event_date_2i"
        select "26", from: "_event_date_3i"
        select "2026", from: "_event_date_1i"
        select "20", from: "_start_time_4i"
        select "00", from: "_start_time_5i"
        find(:css, "#invited_users_[value=#{@user1.id}]").set(true)
        find(:css, "#invited_users_[value=#{@user5.id}]").set(true)
        click_button "Create Party"

        expect(current_path).to eq("/users/#{@user2.id}")

        party = Party.where(movie_id: 290).first

        within "#viewing_parties" do
          expect(page).to have_content("Party ##{party.id}")
        end
      end

      it "the new party should also be listed on other user dashboards if they were invited" do
        fill_in "Duration", with: 137
        select "April", from: "_event_date_2i"
        select "26", from: "_event_date_3i"
        select "2026", from: "_event_date_1i"
        select "20", from: "_start_time_4i"
        select "00", from: "_start_time_5i"
        find(:css, "#invited_users_[value=#{@user1.id}]").set(true)
        find(:css, "#invited_users_[value=#{@user5.id}]").set(true)
        click_button "Create Party"

        party = Party.where(movie_id: 290).first

        visit "/users/#{@user1.id}"
        expect(page).to have_content("Party ##{party.id}")

        visit "/users/#{@user2.id}"
        expect(page).to have_content("Party ##{party.id}")

        visit "/users/#{@user5.id}"
        expect(page).to have_content("Party ##{party.id}")

        visit "/users/#{@user3.id}"
        expect(page).not_to have_content("Party ##{party.id}")

        visit "/users/#{@user4.id}"
        expect(page).not_to have_content("Party ##{party.id}")
      end
    end
  end
end
