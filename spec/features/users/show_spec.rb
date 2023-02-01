require 'rails_helper'

RSpec.describe 'user dashboard' do
  before(:each) do
    @user1 = User.create!(name: 'John Doe', email: 'johndoe@ymail.com')
  end

  it "shows the <user's name>'s dashboard at the top of the page" do
    visit user_path(@user1)

    expect(page).to have_content("John Doe's Dashboard")
  end

  it 'has a button to discover movies' do
    visit user_path(@user1)

    expect(page).to have_button("Discover Movies")
  end
end

# When I visit '/users/:id' where :id is a valid user id,
# I should see:

# "<user's name>'s Dashboard" at the top of the page
# A button to Discover Movies*
# A section that lists viewing parties**