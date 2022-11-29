require 'rails_helper'
require 'faker'

RSpec.describe 'Users' do
  before(:each) do
    @user = User.create!(name: Faker::Name.unique.name, email: Faker::Internet.unique.free_email)

    visit "/users/#{@user.id}"
  end

  describe 'show' do
    it 'has user name dashboard at the top' do
      expect(page).to have_content("#{@user.name} Dashboard")
    end

    it 'has a link styled as a button to discover movies' do
      expect(page).to have_link('Discover Movies')
    end

    it 'has section to display parties' do
      within('#parties') do
        expect(page).to have_content('party here')
      end
    end
  end
end
