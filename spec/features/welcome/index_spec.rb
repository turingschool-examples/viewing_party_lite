require 'rails_helper'

RSpec.describe 'Welcome' do
  it 'shows the title' do
    visit root_path

    expect(page).to have_content('Welcome to Viewing Party')
  end

  it 'links to the registration page' do
    visit root_path

    click_button 'Register'

    expect(current_path).to eq(register_path)
  end

  it 'lists existing users' do
    user1 = User.create!(name: "Bob", email: "bobsmith@gmail.com")
    user2 = User.create!(name: "Jane", email: "janedoe@gmail.com")

    visit root_path

    expect(page).to have_content(user1.email)
    expect(page).to have_content(user2.email)
  end

  it 'links to the landing' do
    visit root_path

    click_link 'Viewing Party'

    expect(current_path).to eq(root_path)
  end
end
