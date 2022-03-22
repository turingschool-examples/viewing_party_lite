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
end
