require 'rails_helper'

RSpec.describe 'the users index page' do

  # before do
  #   @user_1 = User.create!(name: 'Alfonso Diogenes', email: 'alphonsodiogenes420@hotmail.com')
  #   @user_2 = User.create!(name: 'Cradley Booper', email: 'cradleybooper420@hotmail.com')
  #   @user_3 = User.create!(name: 'Jangelina Aolie', email: 'jangelinaaolie420@hotmail.com')
  #   @party_1 = Party.create!(date: '2022-05-10', duration: 147, start_time: '7:00', movie: 'Jurassic Park', host: @user_1.id)
  #   @party_2 = Party.create!(date: '2022-05-11', duration: 112, start_time: '8:00', movie: 'Robocop', host: @user_1.id)
  #   @user_party_1 = UserParty.create!(user_id: @user_1.id, party_id: @party_1.id)
  #   @user_party_2 = UserParty.create!(user_id: @user_1.id, party_id: @party_2.id)
  # end

  it 'shows top 40 movies' do
    @user_1 = User.create!(name: 'Alfonso Diogenes', email: 'alphonsodiogenes420@hotmail.com')
    VCR.use_cassette("shows_top_40_movies") do
      visit user_discover_path(@user_1)
      click_button("Find Top Rated Movies")
      expect(current_path).to eq(user_movies_path(@user_1))
      expect(page).to have_content("The Good, the Bad and the Ugly")
      expect(page).to have_content("The Godfather")
    end
  end
end
