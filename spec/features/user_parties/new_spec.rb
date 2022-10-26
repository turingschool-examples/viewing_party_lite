require 'rails_helper'

RSpec.describe 'new user party page', type: :feature do
  describe 'As a visitor' do
    describe 'When I visit the new user party page (/users/:user_id/movies/:movid_id/viewing-party/new) ' do

      before(:each) do
        @user_1 = create(:user)
        visit login_path
        fill_in(:email, with: "#{@user_1.email}")
        fill_in(:password, with: "#{@user_1.password}")
        click_on("Login")
      end

      it 'I can click create a viewing party and be brough to the right page', :vcr do
        visit "/users/movies/550"

        click_button('Create a Viewing Party')

        expect(current_path).to eq("/users/movies/550/viewing-party/new")
      end

      it 'I should see the name of the movie title rendered above a form with the following fields: duration with default value, date, start time, checkboxes next to each user we want to invite and a create party button', :vcr do
        user1 = create(:user)
        user2 = create(:user)
        user3 = create(:user)
        user4 = create(:user)
        user5 = create(:user)

        visit "/users/movies/550/viewing-party/new"
        expect(page).to have_content('Duration')
        expect(page).to have_content('Date:')
        expect(page).to have_content('Start Time:')

        within('#potential_invitees') do
          expect(page).to have_content("#{user5.name}")
          expect(page).to have_content("#{user4.name}")
          expect(page).to have_content("#{user3.name}")
          expect(page).to have_content("#{user2.name}")
          expect(page).to have_content("#{user1.name}")
          expect(page).to_not have_content("#{@user_1.name}")
        end
      end

      it "When the party is created, the user should be redirected back to the dashboard where the new event is shown. The event should also be listed on any other user's dashbaords that were also invited to the party.", :vcr do
        user1 = create(:user)
        user2 = create(:user)
        user3 = create(:user)
        user4 = create(:user)
        user5 = create(:user)

        visit "/users/movies/550/viewing-party/new"
        fill_in(:duration, with: 1000)
        fill_in(:date, with: "31/10/2022")

        select "18", from: "[start_time(4i)]" #got this by inspecting the page
        within('#potential_invitees') do
          find(:css, "#invitees_#{user2.id}").set(true)
          find(:css, "#invitees_#{user3.id}").set(true)
          end
        click_button('Create Party')

        expect(current_path).to eq(dashboard_path)
        expect(page).to have_content("Date: 10/31/2022")
      end

      it "When the party is created, user_parties are created for each attendee", :vcr do
        user_1 = create(:user)
        user_2 = create(:user)
        user_3 = create(:user)
        user_4 = create(:user)

        visit login_path
        fill_in(:email, with: "#{@user_1.email}")
        fill_in(:password, with: "#{@user_1.password}")
        click_on("Login")
        click_on("Discover Movies")
        click_on("Top Rated Movies")
        click_on("The Godfather")
        click_on("Create a Viewing Party")

        fill_in(:duration, with: 1000)
        fill_in(:date, with: "31/10/2022")

        select "18", from: "[start_time(4i)]" #got this by inspecting the page
        within('#potential_invitees') do
          find(:css, "#invitees_#{user_2.id}").set(true)
          find(:css, "#invitees_#{user_3.id}").set(true)
          end
        click_button('Create Party')

        click_link('Home')
        click_button('Login')

        fill_in(:email, with: "#{user_2.email}")
        fill_in(:password, with: "#{user_2.password}")
        click_on("Login")
        expect(page).to have_content('The Godfather')

        visit login_path
        fill_in(:email, with: "#{user_3.email}")
        fill_in(:password, with: "#{user_3.password}")
        click_on("Login")
        expect(page).to have_content('The Godfather')

        visit login_path
        fill_in(:email, with: "#{user_4.email}")
        fill_in(:password, with: "#{user_4.password}")
        click_on("Login")
        expect(page).to_not have_content('The Godfather')      
      end
    end

    context 'Sad path testing' do
      it 'a viewing party should NOT be created if set to a value less than the duration of the movie', :vcr do
        user_1 = create(:user)
        user2 = create(:user)
        user3 = create(:user)
        user4 = create(:user)
        user5 = create(:user)

        visit login_path
        fill_in(:email, with: "#{user_1.email}")
        fill_in(:password, with: "#{user_1.password}")
        click_on("Login")
        click_on("Discover Movies")
        click_on("Top Rated Movies")
        click_on("The Godfather")
        click_on("Create a Viewing Party")

        fill_in(:duration, with: 1)
        fill_in(:date, with: "31/10/2022")

        select "18", from: "[start_time(4i)]" #got this by inspecting the page
        within('#potential_invitees') do
          find(:css, "#invitees_#{user2.id}").set(true)
          find(:css, "#invitees_#{user3.id}").set(true)
          end
        click_button('Create Party')

        expect(current_path).to eq("/users/movies/238/viewing-party/new")
        expect(page).to have_content("The duration can not be shorter than the run time of the movie, silly.")
      end

      it "I can't create a viewing party without a date", :vcr do
        user_1 = create(:user)
        user2 = create(:user)
        user3 = create(:user)
        user4 = create(:user)
        user5 = create(:user)

        visit login_path
        fill_in(:email, with: "#{user_1.email}")
        fill_in(:password, with: "#{user_1.password}")
        click_on("Login")
        click_on("Discover Movies")
        click_on("Top Rated Movies")
        click_on("The Godfather")
        click_on("Create a Viewing Party")

        fill_in(:duration, with: 380)

        select "18", from: "[start_time(4i)]" #got this by inspecting the page
        within('#potential_invitees') do
          find(:css, "#invitees_#{user2.id}").set(true)
          find(:css, "#invitees_#{user3.id}").set(true)
          end
        click_button('Create Party')
        expect(page).to have_content('Please use a valid time and date')
        expect(current_path).to eq("/users/movies/238/create")
      end
    end
  end
end

