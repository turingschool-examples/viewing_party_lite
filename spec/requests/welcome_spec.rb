require 'rails_helper'

RSpec.describe 'Welcomes', type: :request do
  describe 'GET /index' do
    it 'displays welcome to Viewing Party Lite' do
      visit '/welcome/index'

      expect(page).to have_content('Welcome to Viewing Party Lite!')
    end
  end
end
