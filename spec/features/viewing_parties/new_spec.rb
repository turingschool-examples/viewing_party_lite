require 'rails_helper'

RSpec.describe 'The new viewing party page', :vcr do
  before :each do
    @movie = MoviesFacade.details(438_148)
    users = create_list(:user, 4)

    @host = users[0]
    @user_2 = users[1]
    @user_3 = users[2]
  end

  describe 'When I visit the new viewing party page' do
 
    VCR.use_cassette('minions-details') do
      it 'I see name of movie/form with duration of party/date and time/checkboxes next to each user/button to create' do
        visit login_path
        
        fill_in 'Email', with: "#{@host.email}"
        fill_in 'Password', with: "#{@host.password}"
  
        click_button 'Log In'

        visit new_movie_viewing_party_path(@movie.id)

        expect(page).to have_content(@movie.title)
        expect(page).to have_field('Duration', with: @movie.runtime.to_s)

        fill_in :start_time, with: Faker::Time.forward(days: 7, period: :evening)

        check "_users_#{@user_2.id}"
        click_button "Create Party Viewing Party for #{@movie.title}"

        expect(current_path).to eq(dashboard_path)
        expect(page).to have_content('Viewing Parties')
        expect(page).to have_content(@movie.title)
        expect(page).to have_content(ViewingParty.last.start_time.strftime('The party starts at %I:%M %p on %B %d, %Y'))
        expect(page).to have_content('Hosted Parties')
        expect(page).to have_content('Invited Parties')
      end

      it 'should not show my name in the invite user box' do
        visit login_path
        
        fill_in 'Email', with: "#{@host.email}"
        fill_in 'Password', with: "#{@host.password}"
  
        click_button 'Log In'
                
        visit new_movie_viewing_party_path(@movie.id)

        within '#user-subform' do
          expect(page).not_to have_content(@host.name)
        end
      end

      it 'Displays the event on any users that were invited to the party' do
        visit login_path
        
        fill_in 'Email', with: "#{@host.email}"
        fill_in 'Password', with: "#{@host.password}"
  
        click_button 'Log In'
                
        visit new_movie_viewing_party_path(@movie.id)
        
        fill_in :start_time, with: Faker::Time.forward(days: 7, period: :evening)

        check "_users_#{@user_2.id}"
        click_button "Create Party Viewing Party for #{@movie.title}"

        visit login_path
        
        fill_in 'Email', with: "#{@user_2.email}"
        fill_in 'Password', with: "#{@user_2.password}"
  
        click_button 'Log In'

        visit dashboard_path
        expect(page).to have_content(@movie.title)
        expect(page).to have_content('Invited')
      end

      it 'will not create a viewing party if the duration is less than the movie runtime', :vcr do
        visit login_path
        
        fill_in 'Email', with: "#{@host.email}"
        fill_in 'Password', with: "#{@host.password}"
  
        click_button 'Log In'
                
        visit new_movie_viewing_party_path(@movie.id)
        
        fill_in :start_time, with: Faker::Time.forward(days: 7, period: :evening)
        fill_in 'Duration', with: 10

        check "_users_#{@user_2.id}"

        click_button "Create Party Viewing Party for #{@movie.title}"

        expect(current_path).to eq(new_movie_viewing_party_path(@movie.id))

        expect(page).to have_content('Error: Duration cannot be shorter than movie runtime')
      end

      it 'will not create a viewing party if any fields are left blank' do
        visit login_path
        
        fill_in 'Email', with: "#{@host.email}"
        fill_in 'Password', with: "#{@host.password}"
  
        click_button 'Log In'

        visit new_movie_viewing_party_path(@movie.id)

        click_button "Create Party Viewing Party for #{@movie.title}"

        expect(current_path).to eq(new_movie_viewing_party_path(@movie.id))

        expect(page).to have_content("Error: Start time can't be blank")
      end
    end
  end
end
