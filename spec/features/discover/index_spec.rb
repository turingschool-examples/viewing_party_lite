require 'rails_helper'

describe 'Discover Movies', type: :feature do
  before do
    @user1 = User.create!(name: "John", email: "john.hennerich@gmail.com")
    @user2 = User.create!(name: "Brylan", email: "brylan.gannon112@gmail.com")

    visit user_discover_index_path(@user1)
  end

  it 'Displays discover movie stuff' do
    expect(page).to have_content("Discover Movies")
  end
end
