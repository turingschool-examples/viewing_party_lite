require 'rails_helper'

RSpec.describe "user dashboard" do
  let!(:user) { create :user }
  let!(:viewing_parties) { create_list(:viewing_party, 3)}

  describe 'when I visit a user dashboard' do
    before :each do
      viewing_parties.each do |party|
        user.viewing_parties << party
        visit user_path(user)
      end
    end
    it 'displays a title' do
      expect(page).to have_content("#{user.name}'s Dashboard")
    end

    it 'displays a button to discover movies' do
      expect(page).to have_button('Discover Movies')
    end

    it 'lists viewing parties for the user' do
      within "#viewing-parties" do
        viewing_parties.each do |party|
          expect(page).to have_link "Viewing Party ##{party.id}"
        end
      end
    end
  end
end