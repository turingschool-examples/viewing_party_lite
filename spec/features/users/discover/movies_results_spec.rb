require 'rails_helper'

RSpec.describe 'Movies Results Page', type: :feature do

  describe 'As a Visitor' do 

    it 'clicking Find Top Rated Movies displays the top 40 movies and their vote average on the results page' do
      skeeter = User.create!(name: 'Skeeter', email: 'skeeter@example.com')
      visit "/users/#{skeeter.id}/discover"

      click_button "Find Top Rated Movies"

      expect(page).to have_content("The Shawshank Redemption, Average Vote: 8.7")
      expect(page).to have_content("The Godfather, Average Vote: 8.7")
      # expect the 40th movie here
    end 

  end 
end 