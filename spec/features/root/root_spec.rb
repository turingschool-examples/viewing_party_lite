require 'rails_helper' 

RSpec.describe 'The landing page' do 
  it 'displays the title of application' do 
    user_1 = User.create!(name: 'user_1', email: 'email@gmail.com')
    user_2 = User.create!(name: 'user_2', email: 'email2@gmail.com')
    user_3 = User.create!(name: 'user_3', email: 'email3@gmail.com')
    visit root_path

    within '#title' do 
      expect(page).to have_content('Welcome to Viewing Party')
    end 

    within '#new-user' do 
      expect(page).to have_button 'Register' 
      click_button 'Register'
      expect(current_path).to eq(new_user_path)
    end 

    visit root_path
    within '#users' do 
      expect(page).to have_link(user_1.name)
      click_link(user_1.name)
      expect(current_path).to eq(user_path(user_1.id))
    end 
  end 
end