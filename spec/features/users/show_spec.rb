# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user dashboard (show) page' do
  before(:each) do
    @user = create(:user)
    @other_user = create(:user)
    @movie_1 = Movie.new(movie_data)
    @movie_2 = Movie.new(other_movie_data)
    @viewing_party_1 = ViewingParty.create(viewing_party_data.merge(title: @movie_1.title, poster: @movie_1.poster, user_id: @user.id))
    @viewing_party_2 = ViewingParty.create(other_viewing_party_data.merge(title: @movie_2.title, poster: @movie_2.poster, user_id: @other_user.id))
    @user_party_1 = UserParty.create(user_id: @user.id, viewing_party_id: @viewing_party_1.id)
    @user_party_2 = UserParty.create(user_id: @user.id, viewing_party_id: @viewing_party_2.id)
    visit "/users/#{@user.id}"
  end

  it "shows dashboard name as user name's dashboard" do
    expect(page).to have_content("#{@user.name}'s Dashboard")
  end

  it 'has a button to discover movies' do
    within('div#discover_movies') do
      expect(page).to have_button("Discover Movies")

      click_button("Discover Movies")

      expect(current_path).to eq("/users/#{@user.id}/discover")
    end
  end

  it 'has a section that lists viewing parties' do
    within('div#viewing_parties') do
      expect(page).to have_content("Viewing Parties")
      within("div#viewing_party_#{@viewing_party_1.id}") do
        expect(page).to have_content(@viewing_party_1.title)
        expect(page).not_to have_content(@viewing_party_2.title)
        expect(page).to have_content(@viewing_party_1.start_time)
        expect(page).to have_content("Hosting")
        expect(page).not_to have_content("Invited")
      end
      within("div#viewing_party_#{@viewing_party_2.id}") do
        expect(page).to have_content(@viewing_party_2.title)
        expect(page).not_to have_content(@viewing_party_1.title)
        expect(page).to have_content(@viewing_party_2.start_time)
        expect(page).to have_content("Invited")
        expect(page).not_to have_content("Hosting")
      end
    end
  end
end

# When I visit '/users/:id' where :id is a valid user id,
# I should see:
#
#  "<user's name>'s Dashboard" at the top of the page
#  A button to Discover Movies*
#  A section that lists viewing parties**
