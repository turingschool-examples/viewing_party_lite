require 'rails_helper'

RSpec.describe 'register new user' do

  it "can create a new user" do
    visit '/'
    expect(page).to have_button("Create New User")
    click_button "Create New User"
    expect(current_path).to eq('/register')
    fill_in "Name", with: "Lee"
    fill_in "Email", with: "lee@gmail.com"
    click_button "Register"
    expect(page).to have_content("Lee")
    expect(page).to have_content("lee@gmail.com")
  end

end