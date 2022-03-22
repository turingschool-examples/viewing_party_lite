require 'rails_helper'

RSpec.describe 'the user dashboard' do
  it "exists and has a dynamic title for a user" do
    user_1 = User.create!(name: 'user_1', email: 'email@gmail.com')
    user_2 = User.create!(name: 'user_2', email: 'email2@gmail.com')

    visit user_path(user_1.id)

    expect(current_path).to eq(user_path(user_1.id))

    within '#title' do
      expect(page).to have_content("#{user_1.name}'s Dashboard")
      expect(page).to_not have_content("#{user_2.name}'s Dashboard")
    end
  end

  it "has a discover movies button which links to the discover page" do
    user_1 = User.create!(name: 'user_1', email: 'email@gmail.com')

    visit user_path(user_1.id)

    within '#discover' do
      expect(page).to have_button("Discover Movies")
      click_button "Discover Movies"
      expect(current_path).to eq("/users/#{user_1.id}/discover")
    end
  end

  it "has a section that lists viewing parties" do
    user_1 = User.create!(name: 'user_1', email: 'email@gmail.com')

    visit user_path(user_1.id)

    within '#parties' do
      expect(page).to have_content("My Viewing Parties")
    end
  end
end
