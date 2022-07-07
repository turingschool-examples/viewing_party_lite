require 'rails_helper'
RSpec.describe 'application welcome page' do 
  it 'has title of application' do
    visit '/'
    expect(page).to have_content("Viewing Party Lite")
  end

  it 'has a button to create new user' do
    visit '/'
    expect(page).to have_button("Create New User")
  end

  it 'has a link back to welcome page' do
    visit '/'
    expect(page).to have_link("Home")
  end


end