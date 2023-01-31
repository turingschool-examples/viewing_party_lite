require 'rails_helper'

RSpec.describe 'Landing page', type: :feature do
  let!(:u1) { create(:user) }
  let!(:u2) { create(:user) }

  describe "when I visit '/users/:id' where :id is a valid user id, it" do
    it 'displays the users name' do
      visit user_path(u1)

      expect(page).to have_content("#{u1.name}'s Dashboard")

      visit user_path(u2)

      expect(page).to have_content("#{u2.name}'s Dashboard")
    end

    it "displays a 'Discover Movies' button" do
      visit user_path(u1)

      expect(page).to have_button('Discover Movies')

      click_button 'Discover Movies'

      expect(current_path).to eq discover_user_path(u1)
    end

    it 'displays a section that lists viewing parties'
  end
end
