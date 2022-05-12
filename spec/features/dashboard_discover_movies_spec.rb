require 'rails_helper'
RSpec.describe 'User Dashboard Page Discover Movies' do
  it 'When I go to the user dashboard and click the Discover Movies button' do
    user1 = User.create!(name: 'Will', email: 'abc@mail.com')
    user2 = User.create!(name: 'Craig', email: 'zyx@mail.com')
    user3 = User.create!(name: 'Alicia', email: '321@mail.com')

    visit "/users/#{user1.id}"
    click_button "Discover Movies"

    expect(page).to have_current_path("/users/#{user1.id}/discover")
    expect(page).to_not have_current_path("/users/#{user2.id}/discover")
  end
end