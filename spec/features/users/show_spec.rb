require 'rails_helper'

RSpec.describe "user dashboard" do
  let!(:user) { create :user }
  let!(:viewing_parties) { create_list(:viewing_party, 3)}

  describe 'when I visit a user dashboard' do
    before :each do
      viewing_parties.each do |party|
        user.viewing_parties << party
      end

      visit user_path(user)
    end

    xit 'displays a title' do
      expect(page).to have_content("#{user.name}'s Dashboard")
    end

    xit 'lists viewing parties for the user' do
      within "#viewing-parties" do
        viewing_parties.each do |party|
          expect(page).to have_link "Viewing Party ##{party.id}"
        end
      end
    end

    xit 'displays a discover movies button that links to a discover page for this specific user' do
      expect(page).to have_button('Discover Movies')

      click_button 'Discover Movies'
      
      expect(current_path).to eq(user_discover_index(user))
    end
  end
end