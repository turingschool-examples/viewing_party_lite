require 'rails_helper'

RSpec.describe 'the New Party Page' do

  describe 'party creation' do
    it 'has a form to create a new party' do
      # VCR.use_cassette("user_movies_show", :allow_playback_repeats => true) do
        user = create(:user, id: 50, name: "Bubbles", email: "bubbles@sunnyvale.ca")
        visit "/users/#{user.id}/movies/550/viewing-party/new"
      # end
    end
  end
end