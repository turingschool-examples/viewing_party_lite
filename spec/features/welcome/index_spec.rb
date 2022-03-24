require 'rails_helper'

RSpec.describe 'the welcome page' do

  it 'can create a new user' do
    user = User.create!(name: 'Obama', email: 'obamacare@gmail.com')

    visit '/'

    expect(page).to have_content('Viewing Party')

    click_button('Create a New User')


    expect(current_path).to eq('/register')

    click_link('Home')

    expect(current_path).to eq('/')

    within '.existing_users' do
      expect(page).to have_link("obamacare@gmail.com's Dashboard")
    end
  end

end
