require 'rails_helper'

RSpec.describe 'welcome index page', type: :feature do
  before(:each) do 
    visit root_path
  end

  describe 'as a user' do
    describe 'when I visit root_path' do
      it '- shows the title of the application' do

      end

      it '- has a button to create a new user' do

      end

      it '- shows a list of existing users which links to the users dashboard' do

      end

      it '- has a link to go back to the landing page (this link will be present at the top of all pages' do

      end
    end
  end
end