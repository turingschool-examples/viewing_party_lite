require 'rails_helper'

RSpec.describe 'applications' do 
   it 'welcome page link is on all pages' do 
      visit '/'

      expect(page).to have_link("Home")
      click_link "Home"
      expect(current_path).to eq('/')
   end 
end