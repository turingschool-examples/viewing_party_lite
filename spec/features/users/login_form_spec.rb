require 'rails_helper'

RSpec.describe 'Login form page' do
  describe 'As a registered user' do
    describe "I see the link for login" do
      it 'I click on log in' do
        visit '/'

        click_button "Log In"

        expect(current_path).to eq('/login')
      end

      it 'can log in' do
        @yuji = User.create(name: 'Yuji', email: 'yuji@yuji.com', password: "123", password_confirmation: '123')
        
        visit '/login'

        fill_in('Email', with: 'yuji@yuji.com')
        fill_in('Password', with: '123')
        click_button('Log In')

        expect(current_path).to eq("/users/#{@yuji.id}")
        expect(page).to have_content("Welcome, Yuji!")
      end

      it 'is a sad path' do
        @yuji = User.create(name: 'Yuji', email: 'yuji@yuji.com', password_digest: "123", password_confirmation: '123')
        
        visit '/login'

        fill_in('Email', with: 'yuji@yuji')
        fill_in('Password', with: '12')
        click_button('Log In')

        expect(current_path).to eq("/login")
        expect(page).to have_content("Wrong Email/Password")
      end
    end
  end
end