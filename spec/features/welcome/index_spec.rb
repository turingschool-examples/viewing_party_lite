require 'rails_helper'

RSpec.describe 'The landing page index' do 
  describe 'landing page index' do 
    it 'displays the application title' do 
      visit root_path

      expect(page).to have_content("Viewing Party")
    end
  end
end