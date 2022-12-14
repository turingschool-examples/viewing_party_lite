# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Landing Page' do
  before :each do
    @user1 = create(:user)
    @user2 = create(:user)
    @user3 = create(:user)
    @user4 = create(:user)
  end

  describe 'As a visitor' do
    describe "When I visit '/'" do
      it 'Then I expect to see Title of Application', :vcr do
        visit '/'

        expect(page).to have_content('Viewing Party Lite')
      end

      it 'I see a button to Create a New User', :vcr do
        visit '/'

        expect(page).to have_button('Create New User')
      end

      it 'I do not see a List of Existing User email links', :vcr do
        visit '/'

        expect(page).to_not have_link(@user1.email)
        expect(page).to_not have_link(@user2.email)
        expect(page).to_not have_link(@user3.email)
        expect(page).to_not have_link(@user4.email)
      end
    end

    describe 'I see a link to login' do
      describe 'When I click on the link' do
        it "I'm taken to a Log In page ('/login') where I can input my unique email and password.", :vcr do
          visit '/'

          expect(page).to have_link('Log In')

          click_link('Log In')

          expect(current_path).to eq('/login')
        end
      end
    end
  end

  describe 'As a registered user' do
    before :each do
      visit '/login'
      fill_in :email, with: @user1.email
      fill_in :password, with: @user1.password

      click_on 'Log In'
    end

    describe 'When I visit the landing page' do
      it 'The list of existing users is no longer a link to their show pages. But just a list of email addresses' do
        visit '/'

        expect(page).to_not have_link(@user1.email)
        expect(page).to_not have_link(@user2.email)
        expect(page).to_not have_link(@user3.email)
        expect(page).to_not have_link(@user4.email)

        expect(page).to have_content('Existing Users')
        expect(page).to have_content(@user1.email)
        expect(page).to have_content(@user2.email)
        expect(page).to have_content(@user3.email)
        expect(page).to have_content(@user4.email)
      end
    end
  end
end
