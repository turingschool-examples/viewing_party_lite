# frozen_string_literal: true

require 'rails_helper'

describe 'Login Page' do
  before :each do
    @user = create(:user)
  end

  describe 'As a registered user' do
    describe 'When I visit /login' do
      it 'I can input my unique email and password.' do
        visit '/login'

        expect(page).to have_content('Email')
        expect(page).to have_field(:email)
        expect(page).to have_content('Password')
        expect(page).to have_field(:password)
        expect(page).to have_button('Log In')
        expect(page).to have_link('Home')
      end

      describe 'When I enter my unique email and correct password' do
        it "I'm taken to my dashboard page" do
          visit '/login'

          fill_in :email, with: @user.email
          fill_in :password, with: @user.password

          click_on 'Log In'

          expect(current_path).to eq("/dashboard")
        end
      end

      describe 'When I enter an incorrect password' do
        it "I'm taken back to the Log In page And I can see a flash message telling me that I entered incorrect credentials." do
          visit '/login'

          fill_in :email, with: @user.email
          fill_in :password, with: 'PUUUHHHEGGYY_HILL'

          click_on 'Log In'

          expect(current_path).to eq('/login')
          expect(page).to have_content('Bad Credentials, try again.')
        end
      end
    end
  end
end
