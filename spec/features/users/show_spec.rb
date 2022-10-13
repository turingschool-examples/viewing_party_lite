require 'rails_helper'
require 'date'

RSpec.describe 'the User Show Page' do


  before :each do
    @user1 = create(:user)
    @party1 = create(:party)
    @party2 = create(:party)

    @user2 = create(:user)
    @party3 = create(:party)

    @user3 = create(:user)

    @user_party1 = create(:user_party, user: @user1, party: @party1)
    @user_party2 = create(:user_party, user: @user1, party: @party2)
    @user_party3 = create(:user_party, user: @user2, party: @party3)

    visit "/users/#{@user.id}"
  end

  describe 'the dashboard content' do
    it 'has the users name' do
      expect(page).to have_content("#{@user1.name}'s Dashboard")
      expect(page).to_not have_content("#{@user2.name}'s Dashboard")
    end

    it 'has discover movies button' do
      expect(page).to have_button("Discover Movies")
    end

    it 'has a viewing parties section' do
      expect(page).to have_selector(css: '#user-parties')
    end

    it 'within which the correct number of viewing parties are listed, if any' do
      [@user1, @user2, @user3].each_with_indes do |user, index|
        visit user_path(user)
        within '#user-parties' do
          expect(page).to have_selector(css: '.party-card', count: 2 - index)
        end
      end
    end

    it 'within which the cards display correct party info (no api info yet)' do
      within '#user-parties' do
        within "#party-#{@party1.id}" do
          expect(page).to have_css("img[src*='https://image.tmdb.org/t/p/original#{@party1.img_path}']")
          expect(page).to have_content(@party1.date.to_fs(:long))
          expect(page).to have_content(@party1.start_time.to_fs(:time))
          expect(page).to have_content(@user_party1.user_status)
        end
        expect(page).to_not have_selector(css: "#party-#{@party3.id}")
      end
    end
  end

  describe 'rendering api details' do
    context 'a given card' do
      it 'has info that matches api info for movie with the party movie_id' do
        within '#user-parties' do
          within "#party-#{@party1.id}" do
            VCR.use_cassette("user_dashboard", :allow_playback_repeats => true) do
              expect(page).to have_content(MovieFacade.info_card(@party1.movie_id)[:title])
              expect(page).to have_css("img[src*='https://image.tmdb.org/t/p/original#{MovieFacade.info_card(@party1.movie_id)[:img_path]}']")
            end
          end
        end
      end
    end
  end
end