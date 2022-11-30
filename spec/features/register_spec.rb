require 'rails_helper'

RSpec.describe 'register page' do
  before :each do

  end

  it "should have a form to register user" do
    visit new_register_path
    fill_in "name", with: "Dwight Schrute"
    fill_in "email", with: "dwight.schrute@gmail.com"
    click_button "Register"
    new_user = User.last.id
    expect(current_path).to eq(user_path(new_user))
  end
end
