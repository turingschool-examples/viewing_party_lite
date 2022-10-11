require 'rails_helper'

RSpec.describe "New User Page", type: :feature do
  before :each do
    visit register_path
  end

  it 'has a form to create a new user' do
    fill_in :name, with: "Benji"
    fill_in :email, with: "benji_the_dog@aol.com"
    click_button "Register"
    benji = User.last
    
    expect(benji.name).to eq("Benji")
    expect(current_path).to eq(user_path(benji.id))
  end
end