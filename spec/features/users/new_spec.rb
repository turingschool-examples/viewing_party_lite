require 'rails_helper'

RSpec.describe 'user registration page' do
  before :each do
    User.delete_all
    visit register_path
  end
  
  it 'has a form to create a new user' do
    expect(page).to have_field('Name')
    expect(page).to have_field('Email')
    expect(page).to have_button('Submit')
  end
  
  it 'can be filled in and submitted' do
    fill_in('Name', with: 'Jeff Goldblum')
    fill_in('Email', with: 'JurassicSnark@gmail.com')
    click_on 'Submit'
    
    expect(current_path).to eq(user_path(User.last.id))
    
    expect(page).to have_content('Jeff Goldblum')
  end
end
