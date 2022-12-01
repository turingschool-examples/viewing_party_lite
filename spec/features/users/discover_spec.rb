require 'rails_helper'

RSpec.describe 'Discover Page' do
  describe 'As a User' do
    describe 'When I visit the discover movies page' do
      it 'I see button to for Top Movies and a button for Search with the option to input a keyword' do
        user1 = create(:user)

        visit "/users/#{user1.id}/discover"
        # save_and_open_page
        expect(page).to have_link('Home')
        expect(page).to have_content('Viewing Party Lite')
        expect(page).to have_content('Discover Movies')
        expect(page).to have_button('Find Top Rated Movies')
        expect(page).to have_field('Find Movies')
        expect(page).to have_button('Find Movies')
      end
    end
  end
end
