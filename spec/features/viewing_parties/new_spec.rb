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
      xit 'I see name of movie/form with duration of party/date and time/checkboxes next to each user/button to create' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@host.id)
        visit "/dashboard/movies/#{@movie.id}/viewing_parties/new"

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

      xit 'should not show my name in the invite user box' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@host.id)
        visit "/dashboard/movies/#{@movie.id}/viewing_parties/new"

        within '#user-subform' do
          expect(page).not_to have_content(@host.name)
        end
      end

      xit 'Displays the event on any users that were invited to the party' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@host.id)
        visit "/dashboard/movies/#{@movie.id}/viewing_parties/new"
        
        fill_in :start_time, with: Faker::Time.forward(days: 7, period: :evening)

        check "_users_#{@user_2.id}"
        click_button "Create Party Viewing Party for #{@movie.title}"

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_2.id)

        visit dashboard_path
        expect(page).to have_content(@movie.title)
        expect(page).to have_content('Invited')

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@host.id)

        visit dashboard_path
        expect(page).to_not have_content(@movie.title)
      end

      xit 'will not create a viewing party if the duration is less than the movie runtime', :vcr do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@host.id)
        visit "/dashboard/movies/#{@movie.id}/viewing_parties/new"
        
        fill_in :start_time, with: Faker::Time.forward(days: 7, period: :evening)
        fill_in 'Duration', with: 10

        check "_users_#{@user_2.id}"

        click_button "Create Party Viewing Party for #{@movie.title}"

        expect(current_path).to eq("/dashboard/movies/#{@movie.id}/viewing_parties/new")

        expect(page).to have_content('Error: Duration cannot be shorter than movie runtime')
      end

      xit 'will not create a viewing party if any fields are left blank' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@host.id)

        click_button "Create Party Viewing Party for #{@movie.title}"

        expect(current_path).to eq("/dashboard/movies/#{@movie.id}/viewing_parties/new")

        expect(page).to have_content("Error: Start time can't be blank")
      end
    end
  end
end
