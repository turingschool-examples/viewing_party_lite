require 'rails_helper'

RSpec.describe 'The User show page', type: :feature do
  describe 'the user show page' do

    let!(:user) { create(:user) }
    let!(:invited_party1) { create(:viewing_party) }
    let!(:invited_party2) { create(:viewing_party) }
    let!(:hosted_party1) { create(:viewing_party, host: user) }
    let!(:hosted_party2) { create(:viewing_party, host: user) }
    let!(:vpu1){ create(:viewing_party_user, user: user, viewing_party: invited_party1) }
    let!(:vpu2){ create(:viewing_party_user, user: user, viewing_party: invited_party2) }

    before :each do
      visit user_path(user)
    end

    it 'displays the users name in the title' do
      expect(page).to have_content "#{user.name}'s Dashboard"
    end

    it 'has a button to Discover Movies' do
      expect(page).to have_button "Discover Movies" 

      click_button "Discover Movies"

      expect(current_path).to eq discover_user_path(user)
    end

    describe 'viewing parties' do
      xit 'lists all viewing parties the user has been invited to with their data' do
        invited_parties = user.invited_parties
        #TODO: Some tests will fail until API decisions are made
        within "#invited_parties" do
          invited_parties.each do |party|
            within "invited_#{party.id}" do
              expect(page).to have_content "Movie Title: #{party.movie.title}"
              expect(page).to have_link "#{party.movie.title}"
              expect(page.find('#movie-image')['src']).to have_content 'Movie_Image.' 
              expect(page).to have_content "Date of Event: #{party.date}"
              expect(page).to have_content "Start Time: #{party.start_time}"
              expect(page).to have_content "Host: #{party.host.name}"
              expect(page).to have_content "Invited: #{party.invited}"
              page.html.should include("<b>#{user.name}</b>")
            end
          end
        end
      end

      xit 'lists all viewing parties the user has hosted' do
        hosted_parties = user.hosted_parties
        #TODO: Some tests will fail until API decisions are made
        within "hosted_parties" do
          hosted_parties.each do |party|
            within "hosted_#{party.id}" do
              expect(page).to have_content "You are the host of this viewing party."
              expect(page).to have_content "Movie Title: #{party.movie.title}"
              expect(page).to have_link "#{party.movie.title}"
              expect(page.find('#movie-image')['src']).to have_content 'Movie_Image.' 
              expect(page).to have_content "Date of Event: #{party.date}"
              expect(page).to have_content "Start Time: #{party.start_time}"
              expect(page).to have_content "Invited: #{party.invited}"
            end
          end
        end
      end
    end
  end
end
