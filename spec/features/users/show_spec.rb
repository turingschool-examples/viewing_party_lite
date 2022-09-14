require 'rails_helper'

RSpec.describe 'Users Dashboard Page' do
  xit 'shows users name at the top of the page' do
    user = User.create!(name: 'Gandalf', email: 'gandalfthegrey@wizard', password: "wizard", password_confirmation: "wizard")
    # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(:user)
    
    visit '/login'
    fill_in 'Email', with: 'gandalfthegrey@wizard'
    fill_in 'Password', with: 'wizard'
    click_on ('Submit')

    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("Gandalf's Dashboard")
  end

  xit 'has a button to discover movies' do
    user = User.create!(name: 'Gandalf', email: 'gandalfthegrey@wizard', password: "wizard", password_confirmation: "wizard")

    # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(:user)
    visit '/login'
    fill_in 'Email', with: 'gandalfthegrey@wizard'
    fill_in 'Password', with: 'wizard'
    click_on ('Submit')

    expect(current_path).to eq("/dashboard")

    within '#discover-movies' do
      expect(page).to have_button('Discover Movies')
    end
  end

  xit 'discover movies button redirects to discover page' do
    user = User.create!(name: 'Gandalf', email: 'gandalfthegrey@wizard', password: "wizard", password_confirmation: "wizard")

    visit '/login'
    fill_in 'Email', with: 'gandalfthegrey@wizard'
    fill_in 'Password', with: 'wizard'
    click_on ('Submit')

    within '#discover-movies' do
      click_on 'Discover Movies'
    end
    expect(current_path).to eq("/discover")
  end

  xit 'has a section that lists viewing parties' do
    user = User.create!(name: 'Gandalf', email: 'gandalfthegrey@wizard', password: "wizard", password_confirmation: "wizard")

    visit '/login'
    fill_in 'Email', with: 'gandalfthegrey@wizard'
    fill_in 'Password', with: 'wizard'
    click_on ('Submit')

    expect(current_path).to eq("/dashboard")
    expect(page).to have_content('Viewing Parties')
  end

# User Story #3
# As a visitor
# When I visit the landing page
# And then try to visit '/dashboard'
# I remain on the landing page
# And I see a message telling me that I must be logged in or registered to access my dashboard

  xit 'does not allow visitors to go to the dashboard' do
    visit '/dashboard'
    expect(current_path).to eq(root_path)
    expect(page).to have_content("You must login or register to visit your dashboard.")
  end
end
