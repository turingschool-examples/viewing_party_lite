require 'rails_helper'

RSpec.describe "Welcome Index Page" do
  
  before do
    visit '/'  
  end

  it 'has a header' do
    expect(page).to have_content('Welcome to Viewing Party!')
  end

  it 'displays a button to create a new user' do
    click_button 'Create a New User'    
    
    expect(current_path).to eq('/register')
  end
  
  it 'displays a link to return to the home page at the top' do
    click_link 'Home'    
    
    expect(current_path).to eq('/')
  end
end
