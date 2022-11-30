require 'rails_helper'

RSpec.describe 'Landing Page' do
  it 'has a landing page' do
    visit root_path
    expect(current_path).to eq(root_path)
  end

  it 'has a button to create a New User' do
    visit root_path

    expect(page).to have_button('Create a New User')

    click_button('Create a New User')

    expect(current_path).to eq(register_path)
  end

  it 'has a section that displays existing users emails. Each email is a link to their dashboard page' do
    user1 = User.create!(name: 'Kevin', email: 'Kta@turing.edu')
    user2 = User.create!(name: 'Bryan', email: 'Bkeen@turing.edu')

    visit root_path

    expect(page).to have_content('Existing Users')
    expect(page).to have_content(user1.email)
    expect(page).to have_content(user2.email)
    expect(page).to_not have_content(user1.name)
    expect(page).to_not have_content(user2.name)
  end

  it 'has a home link at top of the page, that goes to landing page' do
    visit root_path

    expect(page).to have_link('Home')
    click_link('Home')

    expect(current_path).to eq(root_path)
  end
end
