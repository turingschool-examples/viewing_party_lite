require 'rails_helper'

RSpec.describe 'welcome index' do
  before(:each) do
    @users = create_list(:user, 10)
    visit root_path
  end

  describe 'When a user visits the root path they should be on the landing page' do
    it 'routes to expected path' do
      expect(current_path).to eq(root_path)
    end

    describe 'Title of Application' do
      it 'Title of Application' do
        expect(page).to have_content('Viewing Party Lite')
      end

      it 'Button to Create a New User' do
        expect(page).to have_button('Create User')
      end

      it 'Lists Existing Users which links to the users dashboard' do
        expect(page).to have_link(@users[0].name)
        expect(page).to have_link(@users[1].name)
        expect(page).to have_link(@users[2].name)
      end

      it 'Links to go back to the landing page which will be present at the top of all pages' do
        expect(page).to have_link('Home')
      end
    end
  end
end