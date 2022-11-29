require 'rails_helper'

RSpec.describe 'welcome index page', type: :feature do
  before(:each) do
    @kenz = User.create!(name: 'Kenz', email: 'kenz_mail@gmail.com')
    @astrid = User.create!(name: 'Astrid', email: 'astrid_mail@gmail.com')
    @reba = User.create!(name: 'Reba', email: 'reba_mail@gmail.com')
    visit root_path
  end

  describe 'as a user' do
    describe 'when I visit root_path' do
      it '- shows the title of the application' do
        expect(page).to have_content('Viewing Party')
      end

      it '- has a button to create a new user' do
        expect(page).to have_button('Create a New User')
        
        click_button 'Create a New User'

        expect(current_path).to eq(new_user_path)
      end

      it '- shows a list of existing users which links to the users dashboard' do
        expect(page).to have_link('kenz_mail@gmail.com', href: user_path(@kenz))
        expect(page).to have_link('astrid_mail@gmail.com', href: user_path(@astrid))
        expect(page).to have_link('reba_mail@gmail.com', href: user_path(@reba))
      end

      it '- has a link to go back to the landing page (this link will be present at the top of all pages)' do
        expect(page).to have_link('Home', href: root_path)
      end
    end
  end
end