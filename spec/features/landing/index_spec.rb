require 'rails_helper'
# FactoryBot.find_definitions

RSpec.describe 'Landing Page' do

  it 'has a button to create a new user' do

    visit "/"

    expect(page).to have_button("Create a New User")

    click_button

    expect(current_path).to eq('/register')

  end
end
