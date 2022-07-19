require 'rails_helper'

RSpec.describe "Login page " do
  before :each do
    @jim = User.create(name: 'jim', email: 'jim@jim.com', password: 'Isuck', password_confirmation: 'Isuck')
  end

  it "can login a user" do
    visit login_path
    fill_in 'email', with: 'jim@jim.com'
    fill_in 'password', with: 'Isuck'
    click_button "Login"
    expect(current_path).to eq('/users/dashboard')
  end

  it "takes you back to the login page if no match found" do
    visit login_path
    fill_in 'email', with: 'jim@jimmy.com'
    fill_in 'password', with: 'Isuck'
    click_button "Login"
    expect(current_path).to eq(login_path)
    expect(page).to have_content("Invalid Credentials")
  end

end
