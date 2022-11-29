require 'rails_helper'

RSpec.describe 'user show page', type: :feature do
  before(:each) do
    @kenz = User.create!(name: 'Kenz', email: 'kenz_mail@gmail.com')
    @astrid = User.create!(name: 'Astrid', email: 'astrid_mail@gmail.com')
    @reba = User.create!(name: 'Reba', email: 'reba_mail@gmail.com')
    visit user_path(@reba)
  end

  describe 'as a user' do 
    describe 'when I visit user_path(:id)' do
      it '- has a link to go back to the landing page (this link will be present at the top of all pages)' do
        expect(page).to have_link('Home', href: root_path)
      end

      it '- shows the users name at the top of the page' do
        expect(page).to have_content("Reba's Dashboard")
      end

      it '- has a button to discover movies' do
        expect(page).to have_button('Discover Movies')
        
        click_button 'Discover Movies'

        expect(current_path).to eq(discover_path(@reba))
      end

      xit '- has a section that lists viewing parties' do

      end
    end
  end
end

