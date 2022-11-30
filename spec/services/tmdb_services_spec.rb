require 'rails_helper'
require 'faker'

RSpec.describe 'TMDB Search' do
  before(:each) do
    @user = User.create!(name: Faker::Name.unique.name, email: Faker::Internet.unique.free_email)
  end

  describe 'happy path' do
    it 'allows users to search for top rated movies' do

      visit user_discover_index_path(@user.id)
      click_link 'Discover Top Rated Movies'

      expect(page.status_code).to eq(200)
    end

  end

end
