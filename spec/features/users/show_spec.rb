require 'rails_helper'

RSpec.describe 'User show page' do
  describe "When I visit 'a users dashboard with a logged in user" do
    before(:each) do
      @user_1 = create(:user)
      visit login_path
      fill_in(:email, with: "#{@user_1.email}")
      fill_in(:password, with: "#{@user_1.password}")
      click_on("Login")
    end

    it "I see '<user's name>'s Dashboard' at the top of the page" do
      expect(page).to have_content(@user_1.name)
    end

    it 'There is a button that leads to the Discover Movies page' do
      user = create(:user)
      visit dashboard_path
      expect(page).to have_button('Discover Movies')
      click_button('Discover Movies')
      expect(current_path).to eq(users_discover_path)
    end

    it 'There is a section that lists viewing parties' do
      user = create(:user)
      visit dashboard_path
      expect(page).to have_content('Viewing Parties')
    end
  end

  describe 'In the user viewing party section of the page' do
    before(:each) do
      @user_1 = create(:user)
      @users_list = create_list(:user, 5)
      @party = create(:party, movie_id: 550, start_time: Time.now)
      @viewing_party = create(:userParty, user_id: @user_1.id, party_id: @party.id, is_host: true)
      visit login_path
      fill_in(:email, with: "#{@user_1.email}")
      fill_in(:password, with: "#{@user_1.password}")
      click_on("Login")
    end

    it 'There is a movie image', :vcr do
      visit dashboard_path

      expect(page).to have_css("img[src*='https://image.tmdb.org/t/p/w200/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg']")
    end

    it 'there is a movie title which links to the movie show page', :vcr do
      
      visit dashboard_path
      click_link 'Fight Club'
      expect(current_path).to eq("/users/movies/550")
      # expect(current_path).to eq(users_discover_path)
    end

    it 'There is a date and time of the event', :vcr do
      expect(page).to have_content(@party.start_time.strftime("%l:%M %p"))
      expect(page).to have_content(@party.date.strftime("%m/%d/%Y"))
    end

    describe "Things I can see when hosting or inviting to a party" do

      before(:each) do
        @users_list = create_list(:user, 5)
        @party = create(:party, movie_id: 550, start_time: Time.now)
        @party2 = create(:party, movie_id: 551, start_time: Time.now)
        create(:userParty, user_id: @users_list[0].id, party_id: @party.id, is_host: false)
        create(:userParty, user_id: @users_list[1].id, party_id: @party.id, is_host: true)
        create(:userParty, user_id: @users_list[2].id, party_id: @party.id, is_host: false)
        create(:userParty, user_id: @users_list[1].id, party_id: @party2.id, is_host: true)
        create(:userParty, user_id: @users_list[0].id, party_id: @party2.id, is_host: false)
        visit login_path
        fill_in(:email, with: "#{@users_list[0].email}")
        fill_in(:password, with: "#{@users_list[0].password}")
        click_on("Login")
      end

      it 'There is a list of invited users with my name in bold', :vcr do
        expect(page).to have_content(@users_list[0].name)
        expect(page).to have_content(@users_list[1].name)
        expect(page).to have_content(@users_list[2].name)
        within("#user-#{@users_list[0].id}") do
          expect(page).to have_css('strong', text: @users_list[0].name)
        end
      end

      it 'I should not see parties I am not invited to', :vcr do
        @users_list = create_list(:user, 5)
        @party = create(:party, movie_id: 550, start_time: Time.now)
        create(:userParty, user_id: @users_list[0].id, party_id: @party.id, is_host: false)
        create(:userParty, user_id: @users_list[1].id, party_id: @party.id, is_host: true)
        create(:userParty, user_id: @users_list[2].id, party_id: @party.id, is_host: false)
        visit login_path
        fill_in(:email, with: "#{@users_list[4].email}")
        fill_in(:password, with: "#{@users_list[4].password}")
        click_on("Login")

        expect(page).not_to have_content('Start time:')
        expect(page).not_to have_content('Date:')
      end

      it 'there is a section to see who the host is', :vcr do
        expect(page).to have_content("#{@users_list[1].name} is the host")
      end

      it 'I should also see viewing parties where I am the host', :vcr do
        visit login_path
        fill_in(:email, with: "#{@users_list[1].email}")
        fill_in(:password, with: "#{@users_list[1].password}")
        click_on("Login")
        expect(page).to have_content('You are the host')
      end

      it 'I should be able to see multiple parties I am attending', :vcr do
        expect(page).to have_content(@party.title)
        expect(page).to have_content(@party2.title)
      end
    end
  end
end