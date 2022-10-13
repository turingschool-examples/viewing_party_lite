require 'rails_helper'

RSpec.describe 'The new viewing party page' do
  before :each do
    VCR.use_cassette('minions-details') do
      @movie = MoviesFacade.details(438148)
      users = create_list(:user, 4)
      
      @user_1 = users[0]
      @user_2 = users[1]
      @user_3 = users[2]
      visit new_user_movie_viewing_party_path(@user_1, @movie.id)

    end
  end
  describe 'When I visit the new viewing party page' do
    VCR.use_cassette('minions-details') do
      xit 'I see name of movie/form with duration of party/date and time/checkboxes next to each user/button to create' do
        
        expect(page).to have_content(@movie.title)
        expect(page).to have_field('Duration', with: "#{@movie.runtime}") 
        
        fill_in :start_time, with: Faker::Time.forward(days: 7, period: :evening)

        check "_users_#{@user_2.id}"
        click_button "Create Party Viewing Party for #{@movie.title}"

        expect(current_path).to eq(user_path(@user_1))
        expect(page).to have_content('Viewing Parties')
        expect(page).to have_content("#{@movie.title}")
        expect(page).to have_content("#{@movie.start_time}")
        expect(page).to have_content("Hosting")
      end

      xit 'Displays the event on any users that were invited to the party' do
        fill_in :start_time, with: Faker::Time.forward(days: 7, period: :evening)

        check "_users_#{@user_2.id}"
        click_button "Create Party Viewing Party for #{@movie.title}"

        visit user_path(@user_2)
        expect(page).to have_content("#{@movie.title}")
        expect(page).to have_content("Invited")

        visit user_path(@user_3)
        expect(page).to_not have_content("#{@movie.title}")
      end

      it 'will not create a viewing party if the duration is less than the movie runtime', :vcr do
        fill_in :start_time, with: Faker::Time.forward(days: 7, period: :evening)
        fill_in 'Duration', with: 10
        
        check "_users_#{@user_2.id}"

        click_button "Create Party Viewing Party for #{@movie.title}"

        expect(current_path).to eq(new_user_movie_viewing_party_path(@user_1, @movie.id))

        expect(page).to have_content('Error: Duration cannot be shorter than movie runtime')
      end
    end

    it 'will not create a viewing party if any fields are left blank', :vcr do
      click_button "Create Party Viewing Party for #{@movie.title}"
      
      expect(current_path).to eq(new_user_movie_viewing_party_path(@user_1, @movie.id))
      
      expect(page).to have_content("Error: Start time can't be blank")
    end
  end
end