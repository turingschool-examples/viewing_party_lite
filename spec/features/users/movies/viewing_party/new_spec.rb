require 'rails_helper' 

RSpec.describe 'new viewing party', type: :feature do 
  let!(:u1) { create(:user) }

  describe 'when I visit the new viewing party page' do
    before :each do 
      WebMock.allow_net_connect!
      visit "/users/#{u1.id}/movies/#{348}/viewing_party/new"
    end
    it 'displays movie title' do
      save_and_open_page
      expect(page).to have_content('Alien')
    end
  end
end