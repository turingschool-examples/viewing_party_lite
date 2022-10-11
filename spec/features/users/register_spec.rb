require 'rails_helper'

RSpec.describe 'the User Registration Page' do

  before :each do
    visit "/register"
  end

  describe 'the user registration form' do
    it 'renders the form' do
      expect(page).to have_content('New User Registration')
      expect(find('form')).to have_content('Email')
      expect(find('form')).to have_button('Register')
    end

  end

end