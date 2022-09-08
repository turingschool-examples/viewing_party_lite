require 'rails_helper'

RSpec.describe 'Users Dashboard Page' do
  it 'shows users name at the top of the page' do
    user = User.create!(name: 'Gandalf', email: 'gandalfthegrey@wizard', password: "wizard", password_confirmation: "wizard")

    visit "/users/#{user.id}"

    within '#header' do
      expect(page).to have_content("Gandalf's Dashboard")
    end
  end

  it 'has a button to discover movies' do
    user = User.create!(name: 'Gandalf', email: 'gandalfthegrey@wizard', password: "wizard", password_confirmation: "wizard")

    visit "/users/#{user.id}"

    within '#discover-movies' do
      expect(page).to have_button('Discover Movies')
    end
  end

  xit 'discover movies button redirects to discover page' do
    user = User.create!(name: 'Gandalf', email: 'gandalfthegrey@wizard', password: "wizard", password_confirmation: "wizard")

    visit "/users/#{user.id}"

    within '#discover-movies' do
      click_on 'Discover Movies'
    end
    expect(current_path).to eq("/users/#{user.id}/discover")
  end

  it 'has a section that lists viewing parties' do
    user = User.create!(name: 'Gandalf', email: 'gandalfthegrey@wizard', password: "wizard", password_confirmation: "wizard")

    visit "/users/#{user.id}"
   
    within '#viewing-parties' do
      expect(page).to have_content('Viewing Parties')
    end
  end
end
