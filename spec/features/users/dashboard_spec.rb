require 'rails_helper'

RSpec.describe 'User Dashboard', type: :feature do
  before :each do
    @user1 = User.create!(name: 'Skeeter', email: 'skeeter@skeeter.com', password: 'test')
    @user2 = User.create!(name: 'Alex', email: 'alex@alex.com', password: 'test123')
    visit '/'
    # save_and_open_page
    within '#login_button' do
      click_button 'Login'
    end
    fill_in 'Name:', with: 'Skeeter'
    fill_in 'Email:', with: 'skeeter@skeeter.com'
    fill_in 'Password', with: 'test'
    click_on 'Submit'
    # save_and_open_page
  end

  xit 'doesnt need an id in the uri' do
    visit '/dashboard'
    # save_and_open_page
    expect(page).to have_content('Skeeter')
    # expect(page).to have_content('skeeter@skeeter.com')
    expect(page).to_not have_content('Alex')
    expect(page).to_not have_content('alex@alex.com')

  end



end 