require 'rails_helper'
RSpec.describe 'welcome page index' do 
  it 'has title of application' do
    visit '/'
    expect(page).to have_content("Viewing Party Lite")
  end

  it 'has a button to create new user' do
    visit '/'
    expect(page).to have_button("Create New User")
  end


end