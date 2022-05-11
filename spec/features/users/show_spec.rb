require 'rails_helper'

RSpec.describe 'the users show page' do

  before :each do
    @user_1 = User.create!(name: 'Alfonso Diogenes', email: 'alphonsodiogenes420@hotmail.com')
    @user_2 = User.create!(name: 'Cradley Booper', email: 'cradleybooper420@hotmail.com')
    @user_3 = User.create!(name: 'Jangelina Aolie', email: 'jangelinaaolie420@hotmail.com')
    @party_1 = Party.create!(date: '2022-05-10', duration: 147, start_time: '7:00', movie: 'Jurassic Park', host: @user_1.id)
    @party_2 = Party.create!(date: '2022-05-11', duration: 112, start_time: '8:00', movie: 'Robocop', host: @user_1.id)
    @user_party_1 = UserParty.create!(user_id: @user_1.id, party_id: @party_1.id)
    @user_party_2 = UserParty.create!(user_id: @user_1.id, party_id: @party_2.id)
  end

  it 'displays the users name at the top of the page' do
    visit user_dashboard_path(@user_1)
    within '.name' do
      expect(page).to have_content("Alfonso Diogenes's Dashboard")
      expect(page).to_not have_content("Cradley Booper's Dashboard")
    end

    visit user_dashboard_path(@user_2)
    within '.name' do
      expect(page).to have_content("Cradley Booper's Dashboard")
      expect(page).to_not have_content("Alfonso Diogenes's Dashboard")
    end
  end

  it 'has a button that links to discover movies' do
    visit user_dashboard_path(@user_1)
    within '.discover-movies' do
      expect(page).to have_button('Discover Movies')
      click_on 'Discover Movies'
      expect(current_path).to eq(user_discover_path(@user_1))
    end
  end

  it 'has a section that lists viewing parties' do
    visit user_dashboard_path(@user_2)
    within '.viewing-parties' do
      expect(page).to have_content("Viewing Parties:")
    end
  end
end
