require 'rails_helper'

RSpec.describe 'register page page' do
  before :each do
    @user1 = User.create!(name: "Jim Bob", email: "jimb@viewingparty.com")
    @user2 = User.create!(name: "Cary Berry", email: "caryb@viewingparty.com")

    visit '/register'
  end

  it 'can register a user by unique email' do
    fill_in "Name", with: "Tyler"
    fill_in "Email", with: "tyler@user.com"
    click_on('Submit')
    expect(current_path).to eq("/users/#{User.last.id}")
  end
end
