require 'rails_helper'

RSpec.describe 'new user party page', type: :feature do
  describe 'As a visitor' do
    describe 'When I visit the new user party page (/users/:user_id/movies/:movid_id/viewing-party/new) ' do

      it 'I should see the name of the movie title rendered above a form with the following fields: duration with default value, date, start time, checkboxes next to each usr we want to invite and a create party button' do

        visit /applications/#{@application1.id}
        expect(page).to have_content('SomeonesName')

      end

      it 'a viewing party should NOT be created if set to a value less than the duration of the movie' do
        visit /applications/#{@application1.id}
        expect(page).to have_content('Add a Pet to this Application')
        expect(page).to have_content('Search for pet by name:')
      end


      it 'When the party is created, the user should be redirected back to the dashboard where the new event is shown.' do
        visit /applications/#{@application1.id}
        expect(page).to have_content('Add a Pet to this Application')
        expect(page).to have_content('Search for pet by name:')
      end

      it "The event should also be listed on any other user's dashbaords that were also invited to the party." do
        visit /applications/#{@application1.id}
        expect(page).to have_content('Add a Pet to this Application')
        expect(page).to have_content('Search for pet by name:')
      end

    end
  end
end

