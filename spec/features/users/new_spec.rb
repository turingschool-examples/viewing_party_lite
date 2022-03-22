require 'rails_helper'

RSpec.describe 'creating a new user' do
  it 'has a form to create a new user' do
    visit '/register'
    fill_in 'Name', with: "Nametest"
    fill_in 'Email', with: "emailtest.test.com"
    save_and_open_page
    click_on "Save"
    user = User.last
    expect(current_path).to eq("/users/#{user.id}")

  end
end
