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

  describe 'creating a new user' do
    context 'given valid data' do
      it 'can create a new user' do
        fill_in "Name", with: "Ricky"
        fill_in "Email", with: "ricky@sunnyvale.ca"
        expect { click_on 'Register' }.to change { User.count }.by(1)
        #current path will be added here once user show page exists
      end
    end

    context 'given invalid data' do
      xit 'redirects to the registration page with error message on how to fix the error' do
        fill_in "Name", with: 123
        fill_in "Email", with: 345
        expect { click_on 'Register' }.to change { User.count }.by(0)
        expect(current_path).to eq("/register")
      end
    end

    context 'given a duplicate email' do
      xit 'redirects to the registration page with error message on how to fix the error' do
        fill_in "Name", with: "Ricky"
        fill_in "Email", with: "ricky@sunnyvale.ca"
        click_on "Register"

        visit "/register"

        fill_in "Name", with: "Ricky"
        fill_in "Email", with: "ricky@sunnyvale.ca"
        click_on "Register"

        expect { click_on 'Register' }.to change { User.count }.by(0)
        expect(current_path).to eq("/register")
      end
    end
  end

end