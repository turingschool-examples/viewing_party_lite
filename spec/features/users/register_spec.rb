require 'rails_helper'

RSpec.describe 'registration page' do
  it "has a form to create a new user" do
    visit '/register'

    fill_in :name, with: "Stephanie"
    fill_in :email, with: "steph23@hotmail.com"

    click_on('Create New User')

    user = User.last
    expect(user.email).to eq("steph23@hotmail.com")
    expect(user.name).to eq("Stephanie")
    expect(current_path).to eq("/users/#{user.id}")
    expect(page).to have_content("Stephanie")
  end
end
