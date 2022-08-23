require 'rails_helper'

RSpec.describe 'Welcome Index' do
  before :each do
    visit '/'
  end

  describe 'When a user visits the root path they should be on the landing page' do
    it 'includes title of application and a button to create a new user' do
      expect(page).to have_content('Viewing Party Lite')
      expect(page).to have_button('Create a New User')    
    end

    xit 'shows a list of existing users which links to the users dashboard' do
      
    end

    xit 'links back to the landing page (this link will be present at the top of all pages' do
      
    end
  end
end