require 'rails_helper'

RSpec.describe 'Welcomes', type: :request do
  describe 'GET /index' do
    it 'displays welcome to Viewing Party Lite' do
      visit '/welcome/index'

      expect(page).to have_content('Welcome to Viewing Party Lite!')
      expect(page).to have_button 'New User'
      expect(page).to have_link 'Existing Users'
      expect(page).to have_link 'Welcome Page'
    end
  end
end
