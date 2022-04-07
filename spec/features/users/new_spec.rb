require 'rails_helper'

RSpec.describe 'register form' do
  it 'displays a form for a user to register' do
    visit '/register'
    # lisa = User.create(name: "Asil", email: "kdjfkd@gmail.com", password: "bradchad", password_confirmation: "bradchad")

    expect(page).to have_content("Register")
    expect(page).to have_button("Create New User")

    fill_in "Name", with: "Asil"
    fill_in "Email", with: "kdjfkd@gmail.com"
    fill_in "Password", with: "bradchad"
    fill_in "Password confirmation", with: "bradchad"
    click_button "Create New User"
    user = User.last.id
    expect(current_path).to eq("/users/#{user}")
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
    user1 = User.create(name: "Asil Rolyat", email: "asil.rolyat@yourmom.com")

    fill_in "Name", with: "Balake Deheempsee"
    fill_in "Email", with: "asil.rolyat@yourmom.com"
    click_button "Create New User"

    expect(page).to have_content("Please kindly fill in all fields with valid email")
  end
end
