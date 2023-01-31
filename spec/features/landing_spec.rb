require 'rails_helper'

RSpec.describe 'Landing page', type: :feature do
  describe 'when a user' do
    describe 'visits the root path, it' do
      it 'should display the app name' do
        visit '/'

        expect(page).to have_content('Viewing Party Lite')
      end

      it 'has a button to create a new user' do
        visit '/'

        expect(page).to have_button('Create a New User')

        click_button 'Create a New User' 

        expect(current_path).to eq new_user_path
      end

      it 'has a list of existing users with links to their dashboards'

      it 'has a link to return to the landing page'
    end
  end
end
