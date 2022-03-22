require 'rails_helper'

RSpec.describe 'register form' do
  it 'displays a form for a user to register' do
    visit '/register'

    expect(page).to have_content("Register")
    expect(page).to have_button("Create New User")

    fill_in "Name", with: "Asil"
    fill_in "Email", with: "asil@gmail.com"
    click_button "Create New User"

    expect(current_path).to eq("/users/#{User.last.id}")
  end

  it 'returns user to same page if all fields are not properly filled' do
    visit '/register'

    fill_in "Name", with: "Asil"
    click_button "Create New User"

    expect(current_path).to eq('/register')
    expect(page).to have_content("Please kindly fill in all fields")
  end

  it 'requires a unique email' do
    visit '/register'

    
  end
end
