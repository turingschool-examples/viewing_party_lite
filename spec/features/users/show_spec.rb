require 'rails_helper'
require 'faker'

RSpec.describe 'Users' do
  before(:each) do
    @user1 = User.create!(name: Faker::Name.unique.name, email: Faker::Internet.unique.free_email)

    visit "/users/#{@user.id}"
  end

  describe 'show' do
    it 'has user name dashboard at the top' do
      expect(page).to have_content("#{@user1.name} Dashboard")
    end

    it 'has a link styled as a button to discover movies' do
      expect(page).to have_link('Discover Movies')
    end

    it 'links to the discover page for the user' do
      click_link('Discover Movies')
      expect(current_path).to eq("/users/#{@user1.id}/discover")
    end


    it 'has section to display parties' do
      within('#parties') do
        expect(page).to have_content('party here')
      end
    end
    describe 'parties section' do
      context 'user is not host' do
        it 'has each party that the user is invited to' do

        end
        it 'has a list of each user invited to the party including my user' do

        end
        it 'has the name of my user in bold in the list' do

        end
      end
      context 'user is host' do
        it 'has each party that the user is host of' do

        end
        it 'has a list of users invited to the party excluding my user' do

        end
      end
      it 'has the movie title of each party that the user is involved in' do

      end
      it 'redirects to the movie show page when the movie title is clicked' do

      end
      it 'has the image of each movie' do

      end
      it 'has the date and time of the event' do

      end
      it 'has the name of the party host' do

      end
    end
  end
end
