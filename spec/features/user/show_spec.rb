require 'rails_helper'

RSpec.describe 'user dashboard page' do

  it "has a users name" do
    user = User.create!(name: 'Beannah Durke', email: 'stogfromper@yahoo.com', password: 'test', password_confirmation: 'test')

    visit "/users/#{user.id}"

    expect(page).to have_content("Beannah Durke's Dashboard")
  end

  it "has a button to a discover movies page" do
    user = User.create!(name: 'Pachary Zrince', email: 'smib@gmail.com', password: 'test', password_confirmation: 'test')

    visit "/users/#{user.id}"

    click_button('Discover Movies')

    expect(current_path).to eq("/users/#{user.id}/discover")
  end

  xit "shows an image" do
    user1 = User.create!(name: 'Fasey Cazio', email: 'chimeralizard@gmail.com', password: 'test', password_confirmation: 'test')
    user2 = User.create!(name: 'Hai Sall', email: 'shoe_eater@speedysauce.com', password: 'test', password_confirmation: 'test')

    viewing_party1 = ViewingParty.create!(date: Time.now.strftime('%d/%m/%y'), start_time: Time.now.strftime('%H:%M'), duration: 120, host_id: user1.id, movie_id: 550)
    viewing_party2 = ViewingParty.create!(date: Time.now.strftime('%d/%m/%y'), start_time: Time.now.strftime('%H:%M'), duration: 120, host_id: user2.id, movie_id: 18)

    party_user1 = PartyUser.create!(user_id: user1.id, viewing_party_id: viewing_party1.id)
    party_user2 = PartyUser.create!(user_id: user2.id, viewing_party_id: viewing_party2.id)

    visit "/users/#{user1.id}"

    within '#viewing_party' do
      expect(page).to have_content('Host: chimeralizard@gmail.com')
      expect(page).to have_content('Fight Club')
      expect(page).to_not have_content('Pulp Fiction')
      expect(page).to_not have_content('shoe_eater@speedysauce.com')
    end

    visit "/users/#{user2.id}"

    within '#viewing_party' do
      expect(page).to have_content('Host: shoe_eater@speedysauce.com')
      expect(page).to have_content('Pulp Fiction')
      expect(page).to_not have_content('Fight Club')
      expect(page).to_not have_content('chimeralizard@gmail.com')
    end
  end
end
