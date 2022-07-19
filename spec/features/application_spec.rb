require 'rails_helper'

RSpec.describe 'the application layout page', type: :feature do
  it 'has a link to landing page/home at the top of landing page' do

    visit "/"

    click_link("Home")

    expect(current_path).to eq("/")
  end

  it 'has a link to home at top of user register page' do

    visit "/register"

    click_link("Home")

    expect(current_path).to eq("/")
  end

  it 'has a link to home from user discover spec' do
    user1 = User.create!(name: 'Sai', email: 'SaiLent@overlord.com', password: "haisall123")

    visit "/users/#{user1.id}/discover"

    click_link("Home")

    expect(current_path).to eq("/")
  end
end
