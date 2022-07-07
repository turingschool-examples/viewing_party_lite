require 'rails_helper'

RSpec.describe 'user dashboard' do
  it 'has discover movies button' do
    user1 = User.create!(email: "user1@example.com", name: "Jeff Casimir")

    visit "/users/#{user1.id}/dashboard"
    click_button "Discover Movies"

    expect(current_path).to eq("/users/#{user1.id}/discover")
  end
end
