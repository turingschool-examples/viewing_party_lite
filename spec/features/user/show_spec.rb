require 'rails_helper'

RSpec.describe "User Dash/Show page", type: :feature do
  before :each do
    @user1 = User.create!(name: 'Sai', email: 'SaiLent@overlord.com')
    @user2 = User.create!(name: 'Parker', email: 'GriffithDidNothing@Wrong.com')
  end

  it 'displays the users name at the top of the page' do
    visit "/users/#{@user2.id}"

    expect(page).to have_content(@user2.name)
    expect(page).to have_content("Parker's Dashboard")
    expect(page).to_not have_content("Sai's Dashboard")
  end

  it 'has a button to discover movies' do
    visit "/users/#{@user1.id}"

    expect(page).to have_button("Discover Movies")
  end

  it 'button to discover movies redirects to discover page' do
    visit "/users/#{@user1.id}"

    click_button("Discover Movies")

    expect(current_path).to eq("/users/#{@user1.id}/discover")
    expect(current_path).to_not eq("/users/#{@user2.id}/discover")
  end

  it 'has a section that lists viewing parties' do #This is a placeholder for now, full functionality on separate ticket
    visit "/users/#{@user1.id}"

    within '#viewingparties' do
      expect(page).to have_content("Viewing Parties")
      expect(page).to have_content("My Viewing Parties")
      expect(page).to have_content("My Invites")
    end
  end
end
