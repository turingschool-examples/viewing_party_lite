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

    it 'the form creates a new party' do
      VCR.use_cassette("new_party", :allow_playback_repeats => true) do
        user = create(:user, id: 50, name: "Bubbles", email: "bubbles@sunnyvale.ca")
        visit "/users/#{user.id}/movies/550/viewing-party/new"
        fill_in "Duration of Party", with: 180
        fill_in "Day", with: Date.today
        fill_in "Start Time", with: Time.now

        expect { click_on 'Create Party' }.to change { Party.count }.by(1)
        party = Party.first

        expect(party.duration).to eq(180)
        expect(party.date).to eq(Date.today)
        expect(party.movie_id).to eq(550)
      end
    end
  end
end