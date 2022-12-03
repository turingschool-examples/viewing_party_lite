# require 'rails_helper'

# RSpec.describe 'new viewing party page', :vcr, type: :feature do
#   before(:each) do
#     @kenz = User.create!(name: 'Kenz', email: 'kenz_mail@gmail.com')
#     @astrid = User.create!(name: 'Astrid', email: 'astrid_mail@gmail.com')
#     @reba = User.create!(name: 'Reba', email: 'reba_mail@gmail.com')

#     @party_1 = Party.create!(movie_id: 550, duration: 170, date: Date.new(2022,12,20), start_time: DateTime.new(2022,12,20,18,30,00))
#     @party_2 = Party.create!(movie_id: 700, duration: 160, date: Date.new(2022,12,27), start_time: DateTime.new(2022,12,27,20,00,00))

#     @kenz_party_1 = UserParty.create!(user_id: @kenz.id, party_id: @party_1.id, user_status: 0)
#     @astrid_party_1 = UserParty.create!(user_id: @astrid.id, party_id: @party_1.id, user_status: 1)
#     @astrid_party_2 = UserParty.create!(user_id: @astrid.id, party_id: @party_2.id, user_status: 0)
#     @reba_party_1 = UserParty.create!(user_id: @reba.id, party_id: @party_2.id, user_status: 2)

#     @movie_details = MovieService.movie_details(550)
#     @movie_reviews = MovieService.movie_reviews(550)
#     @movie_credits = MovieService.movie_credits(550)
#     @movie = Movie.new(@movie_details, @movie_reviews, @movie_credits)

#     visit new_viewing_party_path(@reba, @movie.id)
#   end

  describe 'as as user' do
    describe 'when I visit new_viewing_party_path(user, movie.id)' do
      it 'the form creates a new party' do
        VCR.use_cassette("new_party", :allow_playback_repeats => true) do
          user = create(:user, id: 50, name: "Bubbles", email: "bubbles@sunnyvale.ca")
          visit "/users/#{user.id}/movies/550/viewing-party/new"
      
          fill_in "Day", with: Date.today
          fill_in "Start Time", with: Time.now
  
          expect { click_on 'Create Party' }.to change { Party.count }.by(1)
          party = Party.first
  
          expect(party.duration).to eq(139)
          expect(party.date).to eq(Date.today)
          expect(party.movie_id).to eq(550)
        end
      end
    end
  
    describe 'UserParty creation' do
      it 'creates new user parties for all invited users when the form is submitted' do
        VCR.use_cassette("new_party", :allow_playback_repeats => true) do
          host = create(:user, id: 50, name: "Bubbles", email: "bubbles@sunnyvale.ca")
          guest_1 = create(:user, id: 51, name: "Julian", email: "julian@sunnyvale.ca")
          guest_2 = create(:user, id: 53, name: "Jim Lahey", email: "supervisor@sunnyvale.ca")
          guest_3 = create(:user, id: 54, name: "Ricky", email: "ricky@sunnyvale.ca")
          visit "/users/#{host.id}/movies/550/viewing-party/new"
          
          fill_in "Day", with: Date.today
          fill_in "Start Time", with: Time.now
    
          check("added_users_51")
          check("added_users_53")
         
          expect { click_on 'Create Party' }.to change { UserParty.count }.by(3)
          host_up = UserParty.first
          invitee = UserParty.last
  
          expect(host_up.user_status).to eq("host")
          expect(invitee.user_status).to eq("invited")
          expect(host_up.user_id).to eq(host.id)
          expect(invitee.user_id).to eq(guest_2.id)
          expect(host_up.party_id).to eq(invitee.party_id)
        end
      end
  
      it 'adds the new user parties to the user dashboards and redirects to host dashboard' do
        VCR.use_cassette("new_party", :allow_playback_repeats => true) do
          host = create(:user, id: 50, name: "Bubbles", email: "bubbles@sunnyvale.ca")
          guest_1 = create(:user, id: 51, name: "Julian", email: "julian@sunnyvale.ca")
          guest_2 = create(:user, id: 53, name: "Jim Lahey", email: "supervisor@sunnyvale.ca")
          guest_3 = create(:user, id: 54, name: "Ricky", email: "ricky@sunnyvale.ca")
          visit "/users/#{host.id}/movies/550/viewing-party/new"
          
          fill_in "Day", with: Date.today
          fill_in "Start Time", with: Time.now
        
          check("added_users_51")
          check("added_users_53")
  
          click_on "Create Party"
          
          expect(current_path).to eq(user_path(host.id))
          expect(page).to have_content("host")
  
          visit user_path(guest_2.id)
          expect(page).to have_content("Fight Club")
          expect(page).to have_content("invited")
        end
      end
    end
  end



    #   it '- shows the movie title at the top of the page' do
    #     expect(page).to have_content("Create a Movie Party For Fight Club")
    #   end

    #   it '- has a form to create a new viewing party' do
    #     expect(page).to have_css(".form")
    #   end

    #   it '- has a field for the duration of the party' do
    #     # default value = movie runtime in minutes
    #     # a viewing party should not be created if the value is less than the duration of the movie

    #     within "div.form" do
    #       expect(page).to have_field(:duration, with: 232)

    #       fill_in 'duration', with: '260'
    #     end
    #   end

    #   it '- has a field to select the date of the party' do

    #   end

    #   it '- has a field to select the start time of the party' do

    #   end

    #   it '- shows a checkbox next to each existing user in the system' do

    #   end

    #   it '- show a button to create the party' do
    #     # redirects back to the dashboard (user_path(user_id)) where the new event is shown
    #     # event also gets added to any other users dashboards that were invited to the party

    #   end
    # end
  # end
end