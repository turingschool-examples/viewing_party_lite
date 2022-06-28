require 'rails_helper'

RSpec.describe 'User Dashboard', type: :feature do
  before :each do
    @user2 = User.create!(name: 'Alex', email: 'alex@alex.com', password: 'test123')
    user1 = User.create!(name: 'Skeeter', email: 'skeeter@skeeter.com', password: 'test')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

    # save_and_open_page
  end

  it 'doesnt need an id in the uri' do
    visit '/dashboard'
    # save_and_open_page
    expect(page).to have_content('Skeeter')
    # expect(page).to have_content('skeeter@skeeter.com')
    expect(page).to_not have_content('Alex')
    expect(page).to_not have_content('alex@alex.com')

  end



end 