require 'rails_helper'
require 'faker'

RSpec.describe 'Discover Movies Page' do
  before(:each) do
    @user = User.create!(name: Faker::Name.unique.name, email: Faker::Internet.unique.free_email)

    visit "/users/#{@user.id}/discover"
  end

  describe 'index' do
    it 'has a link to discover top rated movies that links to movies results page' do
      expect(page).to have_link('Discover Top Rated Movies')
      click_link('Discover Top Rated Movies')
      expect(current_path).to eq("/users/#{@user.id}/movies")
    end

    xit 'has a search bar that links to movies results page' do
    end


  end

end
