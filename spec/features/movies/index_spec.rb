require 'rails_helper'

RSpec.describe 'Movies Index Page' do
  let!(:user1) { create(:user) }
  let!(:user2) { create(:user) }

  before :each do
    visit discover_path(user1)
  end

  xit 'goes to movie show page when a link is clicked' do
    click_button('Find Top Rated Movies')
  end
end
