require 'rails_helper'

RSpec.describe 'registration page' do
  it 'displays nav bar, title of application, and registration header' do
    visit '/register'

    expect(page).to have_link('Home')
    expect(page).to have_content('Viewing Party Lite')
    expect(page).to have_content('Register a New User')
  end

  xit 'displays a user registration form' do
    visit '/register'

    fill_in :name, with: "George"
    fill_in :email, with: "george@mail.com"
    click_button "Create a New User"

    george = User.all[0]
    expect(current_path).to eq("/users/#{george.id}")
  end

  describe 'flash messages' do
    xit 'requires unique email' do
      visit '/register'

      fill_in :name, with: "George"
      fill_in :email, with: "george@mail.com"
      click_button "Create a New User"

      visit '/register'

      fill_in :name, with: "Other George"
      fill_in :email, with: "george@mail.com"
      click_button "Create a New User"

      expect(current_path).to eq('/register')
      expect(page).to have_content('Sorry. That email address is not available.')
    end

    xit 'rejects empty fields' do
      visit '/register'

      fill_in :name, with: ""
      fill_in :email, with: "billy@mail.com"
      click_button "Create a New User"

      expect(current_path).to eq('/register')
      expect(page).to have_content('Please fill in all fields.')

      visit '/register'

      fill_in :name, with: "Alfalfa"
      fill_in :email, with: ""
      click_button "Create a New User"

      expect(current_path).to eq('/register')
      expect(page).to have_content('Please fill out all fields.')
    end
  end
end
