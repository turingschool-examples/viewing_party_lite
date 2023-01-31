require 'rails_helper'

RSpec.describe 'Application' do
  it 'has a link to create a new user' do
    visit root_path
    expect(page).to have_content('Viewing Party')
    expect(page).to have_button('Create a New User')
    
    click_on ('Create a New User') 
    expect(current_path).to eq('/register') 
  end
end