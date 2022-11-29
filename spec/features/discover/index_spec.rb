require 'rails_helper'
require 'faker'

RSpec.describe 'Discover Movies Page' do
  before(:each) do
    @user = User.create!(name: Faker::Name.unique.name, email: Faker::Internet.unique.free_email)

    visit "/users/#{@user.id}/discover"
  end

  describe 'index' do
    it 'has a link to discover top rated movies' do
      expect(page).to have_link('Discover Top Rated Movies')
    end

  end

end
