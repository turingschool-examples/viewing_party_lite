require 'rails_helper'

RSpec.describe 'Application' do
  it 'has a link to create a new user' do
    visit root_path
    expect(page).to have_content('Viewing Party')
    expect(page).to have_button('Create a New User')
    
    click_on ('Create a New User') 
    expect(current_path).to eq('/register') 
  end

  it 'has existing users with links to their dashboards' do
    user_1 = create(:user)
    user_2 = create(:user)
   
    visit root_path
    within("#users") do
      expect(page).to have_content('Existing Users')
      expect(page).to have_link(user_1.name)
      expect(page).to have_link(user_2.name)
    end

    click_link ("#{user_1.name}")
    expect(current_path).to eq("/users/#{user_1.id}")
  end

  it 'has a link back to landing page' do
    visit root_path

    expect(page).to have_link('Home')

    click_link ('Home')
    
    expect(current_path).to eq(root_path)
  end
end