require 'rails_helper'

RSpec.describe 'New user' do

  it 'can create a new user and redirect to the user show page' do
    visit register_path

    fill_in 'Name', with: 'Happy Lama'
    fill_in 'Email', with: 'Happy_Lama@example.com'
    fill_in 'Password', with: 'happy1'
    fill_in 'Password confirmation', with: 'happy1'
    
    click_button 'Create User'

    lama = User.last

    expect(current_path).to eq(user_path(lama))
    expect(page).to have_content(lama.name)
    expect(page).to have_content("Your account was created")
  end

  it 'will return detailed error messages if new user cannot be created' do
    visit register_path

    fill_in 'Email', with: 'Happy_Lama@example.com'
    fill_in 'Password', with: 'happy1'
    fill_in 'Password confirmation', with: 'happy'

    click_button 'Create User'

    lama1 = User.last

    expect(current_path).to eq(register_path)
    expect(page).to have_content("Error: Name can't be blank and Password confirmation doesn't match Password")
  end
end
