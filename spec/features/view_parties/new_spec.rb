require 'rails_helper'

RSpec.describe "User Movies View Parties New page" do
  describe "creation form", :vcr do
    before :each do
      @user = User.create!(name: "Peter Cushing", email: "helsing@hammer.com")
      @user2 = User.create!(name: "Christopher Lee", email: "dracula@hammer.com")
      @movie = Movie.new(id: 11868, title: "Dracula", vote_average: 7.3, runtime: 82) # aka 'Horror of Dracula' in the US
      visit "/users/#{@user.id}/movies/#{@movie.id}/view_parties/new"
    end

    it "exists and has the name of the movie" do
      expect(page).to have_content(@movie.title)
    end

    it "has a 'Duration of Party' field with a default value of movie runtime in minutes" do
      expect(page).to have_field(:duration, with: '82')
    end

    it "has a 'When' field to select date" do
      expect(page).to have_field(:date)
    end

    it "has a 'Start Time' field to select time" do
      expect(page).to have_field(:time)
    end

    it "has checkboxes next to each existing user in the system" do
      expect(page).to have_field("#{@user2.id}")
    end

    xit "has a button to create a party" do
      # When the party is created, the user should be redirected back to
      # the dashboard where the new event is shown.
      # The event should also be listed on any other user's dashbaords
      # that were also invited to the party.
      visit "users/#{@user.id}"
      expect(page).to_not have_content(@movie.title)
      visit "/users/#{@user.id}/movies/#{@movie.id}/view_parties/new"

      fill_in(:date, with: '10/31/22')
      fill_in(:time, with: '22:00')
      check(@user2.name)
      click_button('Create Party')

      expect(current_path).to eq("users/#{@user.id}")
      expect(page).to have_content(@movie.title)
    end

    xit "will not create a party if the value is less than the duration of the movie" do
      fill_in(:duration, with: '81')
      fill_in(:date, with: '10/31/22')
      fill_in(:time, with: '22:00')
      click_button('Create Party')

      expect(current_path).to eq("/users/#{@user.id}/movies/#{@movie.id}/view_parties/new")
      expect(page).to have_content("Duration of party cannot be less than movie runtime")
    end
  end
end
