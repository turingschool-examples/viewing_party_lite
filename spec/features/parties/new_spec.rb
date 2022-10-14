require 'rails_helper'

RSpec.describe 'New Viewing Party Page' do
  before(:each) do
    VCR.use_cassette("godfather_party") do
      @movie = MoviesFacade.movie_details(238)
      users = FactoryBot.create_list(:random_user, 5)

      @user_1 = users[0]
      @user_2 = users[1]
      @user_3 = users[2]
      @user_4 = users[3]
      @user_5 = users[4]
      visit new_user_movie_party_path(@user_1, @movie.id)
    end
  end

  describe "when I visit the new viewing party page" do
    VCR.use_cassette("godfather_party_2") do
      it 'I see the name of the movie, rendered above a form to create a new party' do
        expect(page).to have_content(@movie.title)
        expect(page).to have_field("duration")

        expect(page).to have_button("Submit")
      end

      it 'will create a new viewing party when I fill in the fields with admissable values', :vcr do
        fill_in :start_time, with: Faker::Time.forward(days: 1, period: :evening).to_formatted_s(:time)
        fill_in :date, with: Faker::Time.forward(days: 4).to_formatted_s(:date)

        click_button("Submit")
        expect(current_path).to eq(user_path(@user_1))
        expect(page).to have_content("Godfather")
      end

      it 'can create a new viewing party with invitees', :vcr do
        fill_in :start_time, with: Faker::Time.forward(days: 1, period: :evening).to_formatted_s(:time)
        fill_in :date, with: Faker::Time.forward(days: 4).to_formatted_s(:date)
        check @user_2.email
        click_button "Submit"
        expect(current_path).to eq(user_path(@user_1))
      end

      it 'will not create a new party if the start date and time are not filled out', :vcr do
        click_button "Submit"

        expect(current_path).to eq new_user_movie_party_path(@user_1, @movie.id)
        expect(page).to have_content "Please Input a Valid Day and Time"
      end
    end
  end
end

# _Duration of Party with a default value of movie runtime in minutes; a viewing party should NOT be created if set to a value less than the duration of the movie
# _When: field to select date
# _Start Time: field to select time
# _Checkboxes next to each existing user in the system
# _Button to create a party

# Details: When the party is created, the user should be redirected back to the dashboard where the new event is shown. The event should also be listed on any other user's dashbaords that were also invited to the party.
