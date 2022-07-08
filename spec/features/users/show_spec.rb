require 'rails_helper'

RSpec.describe "Dashboard Page" do
  it 'has correct title' do
    user = User.create(name: 'Geddy', email: '2112@yyz.com')
    visit "/users/#{user.id}"

    expect(page).to have_content("Geddy's Dashboard")
  end

  it 'has a button to navigate to discover movie page', :vcr do
    user = User.create(name: 'Geddy', email: '2112@yyz.com')
    visit "/users/#{user.id}"
    click_button("Discover Movies")

    expect(current_path).to eq("/users/#{user.id}/discover")
  end
end
