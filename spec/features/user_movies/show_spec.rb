require 'rails_helper'

RSpec.describe 'the user movie show page', type: :feature do
  before :each do
    @user = create(:user)
  end

  describe 'movie details section' do
    it 'shows the movies details' do
      visit "/users/#{@user.id}/movies/550"
    end
  end
end