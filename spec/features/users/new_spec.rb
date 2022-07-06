require 'rails_helper'

RSpec.describe 'New User Registation Page', type: :feature do

  it "has a form to create a new user and taken back to user show page" do
    user = User.create!(name: 'Chealsea', email: 'chealsea@comcast.net')
    visit register_path
    fill_in :name, with: 'George'
    fill_in :email, with: 'banana@gmail.com'
    click_button 'Register User'
    expect(current_path).to eq(user_path(User.last.id))
    expect(page).to have_content('Name: George') 
    expect(page).to have_content('E-mail: banana@gmail.com')
    expect(page).to_not have_content('Name: Chealsea')
  end
  
end
