require 'rails_helper'

RSpec.describe 'Users Dashboard Page' do
  it 'shows users name at the top of the page' do
    user = User.create!(name: 'Gandalf', email: 'gandalfthegrey@wizard', password: "wizard", password_confirmation: "wizard")
    # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(:user)
    
    visit '/login'
    fill_in 'Email', with: 'gandalfthegrey@wizard'
    fill_in 'Password', with: 'wizard'
    click_on ('Submit')

    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("Gandalf's Dashboard")
  end

  it 'has a button to discover movies' do
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

  it 'discover movies button redirects to discover page' do
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

  it 'has a section that lists viewing parties' do
    user = User.create!(name: 'Gandalf', email: 'gandalfthegrey@wizard', password: "wizard", password_confirmation: "wizard")

    visit '/login'
    fill_in 'Email', with: 'gandalfthegrey@wizard'
    fill_in 'Password', with: 'wizard'
    click_on ('Submit')

    expect(current_path).to eq("/dashboard")
    expect(page).to have_content('Viewing Parties')
  end
end
