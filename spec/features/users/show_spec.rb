require 'rails_helper'

RSpec.describe 'The User show page', type: :feature do
  describe 'the user show page' do

    let!(:user) { create(:user) }

    before :each do
      visit user_path(user)
    end

    it 'displays the users name in the title' do
      expect(page).to have_content "#{user.name} Dashboard"
    end

    it 'has a button to Discover Movies' do
      expect(page).to have_button "Discover Movies" 
    end

    describe 'viewing parties' do
      xit 'displays each viewing parties data' do
         
      end

      xit 'lists all viewing parties the user has been invited to' do

      end

      xit 'lists all viewing parties the user has hosted' do

      end
    end
  end
end
