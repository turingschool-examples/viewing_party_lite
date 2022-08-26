require 'rails_helper'

RSpec.describe 'user dashboard', type: :feature do
  let!(:user1) { FactoryBot.create(:user) }
  let!(:user2) { FactoryBot.create(:user) }
  let!(:user3) { FactoryBot.create(:user) }
  let!(:event) { FactoryBot.create(:movie) }
  let!(:event2) { FactoryBot.create(:movie) }
  let!(:event3) { FactoryBot.create(:movie) }
  let!(:event_user) { FactoryBot.create(:event_user, user: user1, movie: event, role: 0) }
  let!(:event_user2) { FactoryBot.create(:event_user, user: user2, movie: event2, role: 0) }
  let!(:event_user3) { FactoryBot.create(:event_user, user: user3, movie: event3, role: 0) }
  let!(:event_user4) { FactoryBot.create(:event_user, user: user1, movie: event2, role: 1) }
  let!(:event_user5) { FactoryBot.create(:event_user, user: user1, movie: event3, role: 1) }
  
  before(:each) do
    visit "/users/#{user1.id}"
    @url = "https://image.tmdb.org/t/p/w500"
  end

  it 'should show the users name' do
    @url = "https://image.tmdb.org/t/p/w500"
    expect(page).to have_content(user1.username)
    expect(page).not_to have_content(user2.username)
  end

  it 'should have a link to go back to the landing page at the top of the page' do
    expect(page).to have_link('Viewing Party!', href: '/')
  end

  it 'should have a link to discover movies' do
    expect(page).to have_link("Discover Movies")

    click_link "Discover Movies"

    expect(current_path).to eq("/users/#{user1.id}/discover")
  end

  #add img_url, movie_name to event model
  describe "viewing parties", :vcr do
    it "shows parties that the user has been invited to" do
      within "#invited-parties" do
        within "#event-#{event2.id}-#{event2.movie_id}" do
          within "#event-#{event2.id}-#{event2.title}" do
            expect(page).not_to have_link(event.title)
            expect(page).to have_link(event2.title)
          end

          within "#event-#{event2.id}-image" do
            expect(page).not_to have_image(event.image_url)
            expect(page).to have_image(event2.image_url)
          end

          within "#event-#{event2.id}-#{event2.event_date}" do
            expect(page).not_to have_content(event.event_date)
            expect(page).to have_content(event2.event_date)
          end

          within "#event-#{event2.id}-#{event2.duration}" do
            expect(page).not_to have_content(event.duration)
            expect(page).to have_content(event2.duration)
          end
        end
      end
    end

    it "shows parties that the user has created" do
      within "#created-parties" do
        within "#event-#{event.id}-#{event.movie_id}" do
          expect(page).to have_link(event.movie_id)
          expect(page).not_to have_link(event2.movie_id)
        end

        within "#event-#{event.id}-image" do
          expect(page).to have_image(event.image_url)
          expect(page).not_to have_image(event2.image_url)
        end

        within "#event-#{event.id}-#{event.start_time}" do
          expect(page).to have_content(event.start_time)
          expect(page).not_to have_content(event2.start_time)
        end

        within "#event-#{event.id}-#{event.event_date}" do
          expect(page).to have_content(event.event_date)
          expect(page).not_to have_content(event2.event_date)
        end

        within "#event-#{event.id}-#{event.duration}" do
          expect(page).to have_content(event.duration)
          expect(page).not_to have_content(event2.duration)
        end
      end
    end
  end
end

#  Movie Image
#  Movie Title, which links to the movie show page
#  Date and Time of Event
#  who is hosting the event
#  list of users invited, with my name in bold

#  Movie Image
#  Movie Title, which links to the movie show page
#  Date and Time of Event
#  That I am the host of the party
#  List of friends invited to the viewing party