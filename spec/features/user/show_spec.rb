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

  xit 'has a button to discover movies' do

  end

  xit 'has a section that lists viewing parties' do #This is a placeholder for now, full functionality on separate ticket

  end
end
