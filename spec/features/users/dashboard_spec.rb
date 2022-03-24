require "rails_helper"

RSpec.describe 'The User Dashboard' do
  describe 'will display a button to discover movies the uder parties in host/ attendee sections' do
    it 'had a display movies button' do

      lama = User.create!(name: 'Happy Lama', email: 'Happy_Lama@example.com')
      duck = User.create!(name: 'Sad Duck', email: 'Sad_Duck@example.com')
      movie1 = Party.create!(movie_id: 1, duration_time: 127, start_date: Date.today, start_time: Time.now, user_id: lama.id, movie_name: 'Jump for Joy')
      movie2 = Party.create!(movie_id: 2, duration_time: 233, start_date: Date.today, start_time: Time.now, user_id: duck.id, movie_name: 'Cry for sad')

      visit  user_path(lama)
    
      expect(page).to have_content("@#{lama.name}'s Dashboard")
      expect(page).to have_button('Discover Movies')
      expect(page).to have_content('Viewing Parties')

      within('#hosting-0') do
        expect(page).to have_content(movie1.movie_name)
        expect(page).to have_content(movie1.start_date)
        expect(page).to have_content(movie1.start_time)
        expect(page).to have_content(movie1.user_status)
      end

      within('#invite-0') do
        expect(page).to have_content(movie2.movie_name)
        expect(page).to have_content(movie2.start_date)
        expect(page).to have_content(movie2.start_time)
        expect(page).to have_content(movie2.user_status)
      end
    end
  end
end
