require 'rails_helper'

RSpec.describe 'the New Party Page' do

  describe 'party creation' do
    it 'has a form to create a new party' do
      VCR.use_cassette("new_party", :allow_playback_repeats => true) do
        user = create(:user, id: 50, name: "Bubbles", email: "bubbles@sunnyvale.ca")
        visit "/users/#{user.id}/movies/550/viewing-party/new"
        expect(page).to have_content('Create a Movie Party for Fight Club')
        expect(find('form')).to have_content('Day')
        expect(find('form')).to have_content('Start Time')
        expect(find('form')).to have_button('Create Party')

      end
    end
  end
end