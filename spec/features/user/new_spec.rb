require 'rails_helper'

RSpec.describe "New User" do

  it "should have a form to create new user" do
    visit '/register'

    expect(page).to have_field("Name")
    expect(page).to have_field("Email")
    expect(page).to have_button("Register")
    click_button "Register"
    expect(current_path).to eq("/users/#{user_id}") 
  end
end
