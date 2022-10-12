require 'rails_helper'

RSpec.describe 'User Dashboard', type: :feature do
  describe 'As a User' do
    it 'shows users names dashboard at top of page' do
      user_1 = User.create!(name: 'First User', email: 'firstuser@mail.com')
      user_2 = User.create!(name: 'Second Visitor', email: 'secondvisitor@email.com')

      visit user_path(user_1.id)

      expect(page).to have_content(user_1.name)
      expect(page).to have_content("First User's Dashboard")
      expect(page).to_not have_content("Second Visitor's Dashboard")
    end

    it 'has a button to discover movies' do
      user_1 = User.create!(name: 'First User', email: 'firstuser@mail.com')
      visit user_path(user_1.id)
      expect(page).to have_button('Discover Movies')
    end

    it 'has a section that lists viewing parties' do
      user_1 = User.create!(name: 'First User', email: 'firstuser@mail.com')
      visit user_path(user_1.id)
      expect(page).to have_content('Viewing Parties')
    end

    describe 'Veiwing parties' do
      describe 'I should see the viewing parties that the user has been invited to with the following details:' do 
        before :each do
          @user_1 = User.create!(name: 'Jane', email: 'jane@mail.com')
          @user_2 = User.create!(name: 'John', email: 'john@mail.com')
          @user_3 = User.create!(name: 'Megan', email: 'megan@mail.com')
          @user_4 = User.create!(name: 'Mike', email: 'mike@mail.com')

          @party_1 = Party.create!(movie_id: 8, duration: 80, date:'2023/8/10', start_time:'21:00', host_id: @user_1.id)
          @party_2 = Party.create!(movie_id: 2, duration: 73, date: '8/12/2022', start_time:'18:00', host_id:@user_3.id)
          @party_3 = Party.create!(movie_id: 3, duration: 74, date:'12/11/2022', start_time:'16:30', host_id: @user_2.id)

          @party_1.users << @user_1
          @party_1.users << @user_2
          @party_1.users << @user_3

          @party_2.users << @user_1
          @party_2.users << @user_2
          @party_2.users << @user_3
          @party_2.users << @user_4

          @party_3.users << @user_1
          @party_3.users << @user_2
        end

        it 'Each viewing party has a Movie Image' do
          visit user_path(@user_1)

          expect(page).to have_css("img[src = #{MovieFacade.movie_data(@party_1.movie_id).image}]")
          expect(page).to have_css("img[src = #{MovieFacade.movie_data(@party_2.movie_id).image}]")
          expect(page).to have_css("img[src = #{MovieFacade.movie_data(@party_3.movie_id).image}]")

          visit user_path(@user_4)

          expect(page).to have_css("img[src = #{MovieFacade.movie_data(@party_2.movie_id).image}]")

          expect(page).to_not have_css("img[src = #{MovieFacade.movie_data(@party_1.movie_id).image}]")
          expect(page).to_not have_css("img[src = #{MovieFacade.movie_data(@party_3.movie_id).image}]")
        end

        it 'Each viewing party has a Movie Title, which links to the movie show page' do
          visit user_path(@user_1)

          expect(page).to have_link("#{MovieFacade.movie_data(@party_1.movie_id).title}")
          expect(page).to have_link("#{MovieFacade.movie_data(@party_2.movie_id).title}")
          expect(page).to have_link("#{MovieFacade.movie_data(@party_3.movie_id).title}")

          visit user_path(@user_4)

          expect(page).to have_link("#{MovieFacade.movie_data(@party_2.movie_id).title}")

          expect(page).to_not have_link("#{MovieFacade.movie_data(@party_1.movie_id).title}")
          expect(page).to_not have_link("#{MovieFacade.movie_data(@party_3.movie_id).title}")
        end
          
        it 'Each viewing party has a Date and Time of the Event' do
          visit user_path(@user_1)

          expect(page).to have_content(@party_1.date.strftime('%B %e, %Y'))
          expect(page).to have_content(@party_2.date.strftime('%B %e, %Y'))
          expect(page).to have_content(@party_3.date.strftime('%B %e, %Y'))

          visit user_path(@user_4)

          expect(page).to have_content(@party_2.date.strftime('%B %e, %Y'))

          expect(page).to_not have_content(@party_1.date.strftime('%B %e, %Y'))
          expect(page).to_not have_content(@party_3.date.strftime('%B %e, %Y'))
        end

        it 'Each viewing party has a who is hosting, list of users invited' do

        end
      
      end
    end
  end
end
