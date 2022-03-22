require 'rails_helper'

RSpec.describe 'welcome page', type: :feature do 
   it 'user visits welcome page' do 
      visit '/'

      expect(page).to have_content("Viewing Party Lite")
   end 
end