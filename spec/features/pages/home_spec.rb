require 'rails_helper'

RSpec.describe 'the home page' do

  
  it "has the title 'Viewing Party'" do
    visit '/'

    expect(page).to have_content('Viewing Party')
  end

  xit "has a button to create a new user" do
    visit '/'

    expect(page).to have_button('Create New User')

    click_button 'Create New User'

    expect(current_path).to eql('/users/new')
  end

  xit "has a list of existing users with each user being a link to their respective dashboard" do
    visit '/'

    expect(page).to have_content()
  end
end