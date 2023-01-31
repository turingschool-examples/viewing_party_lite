require 'rails_helper'

RSpec.describe "user show page" do 
  before(:all) do
    User.delete_all
    @user = create(:user)
  end

  it 'displays the site and page title' do
    visit user_path(@user.id)

    expect(page).to have_content("Viewing Party")
    expect(page).to have_content("#{@user.name}'s Dashboard")
  end

  it 'has a button to link to the discover movies page' do
    visit user_path(@user.id)

    within "#discover_link" do
      expect(page).to have_link "Discover Movies", href: "/users/#{@user.id}/discover"
      click_link "Discover Movies"
      expect(current_path).to eq("/users/#{@user.id}/discover")
    end
  end

  it 'has a section for viewing parties' do
    visit user_path(@user.id)

    within("#viewing_parties") do
      expect(page).to have_content('My Viewing Parties')
    end
  end
end