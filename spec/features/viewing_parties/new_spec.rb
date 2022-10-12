require 'rails_helper'

RSpec.describe 'The new viewing party page' do
  describe 'When I visit the new viewing party page' do
    let!(:movie) { Movie.new({title: "Minions", vote_average: "8.7"}) }

    let!(:users) { create_list(:user, 4) }

    let!(:user_1) { users[0] }
    let!(:user_2) { users[1] }
    let!(:user_3) { users[2] }

    it 'I see name of movie/form with duration of party/date and time/checkboxes next to each user/button to create' do
      visit new_user_movie_viewing_party_path(user_1, movie)
      
      expect(page).to have_content(movie.title)
      expect(page).to have_field('Duration', with: "#{movie.runtime}") #runtime should be in minutes
      select '2022/10/31', :from => 'Day'
      select '8:00', :from => 'Start time'
      check "#{user_2}"
      click_button 'Create Party'

      expect(current_path).to eq(user_path(user_1))
      expect(page).to have_content('Viewing Parties')
      expect(page).to have_content("#{movie.title}")
      expect(page).to have_content("#{movie.start_time}")
      expect(page).to have_content("Hosting")
    end

    xit 'Displays the event on any users that were invited to the party' do
      visit new_user_movie_viewing_party(user_1, movie)

      select '2022/10/31', :from => 'Day'
      select '8:00', :from => 'Start time'
      check "#{user_2}"
      click_button 'Create Party'

      visit user_path(user_2)
      expect(page).to have_content("#{movie.title}")
      expect(page).to have_content("Invited")

      visit user_path(user_3)
      expect(page).to_not have_content("#{movie.title}")
    end

    xit 'will not create a viewing party if the duration is less than the movie runtime' do
      visit new_user_movie_viewing_party(user_1, movie)

      fill_in 'Duration', with: '10'
      select '2022/10/31', :from => 'Day'
      select '8:00', :from => 'Start time'
      check "#{user_2}"

      click_button 'Create Party'

      expect(current_path).to eq(new_user_movie_viewing_party(user_1, movie))

      expect(page).to have_content('Error: Duration cannot be shorter than movie runtime')
    end
  end
end