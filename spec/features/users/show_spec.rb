require 'rails_helper'

RSpec.describe 'User Dashboard Page' do
  describe 'user visits the dashboard page', :vcr do
    before :each do
      @user_1 = create(:user)
      @user_2 = create(:user)
      @user_3 = create(:user)

      @party_1 = create(:party, movie_id: 278, host_id:@user_3.id) #shawshank
      @party_2 = create(:party, movie_id: 889,host_id:@user_3.id) #flinstones
      @party_3 = create(:party, movie_id: 254,host_id:@user_3.id) 
      @party_4 = create(:party, movie_id: 889,host_id:@user_3.id)
      @party_5 = create(:party, movie_id: 254,host_id:@user_3.id)
      @party_6 = create(:party, movie_id: 889,host_id:@user_1.id)
      @party_7 = create(:party, movie_id: 278,host_id:@user_2.id)


      create(:user_parties, user_id: @user_1.id, party_id: @party_1.id)
      create(:user_parties, user_id: @user_2.id, party_id: @party_1.id)
      create(:user_parties, user_id: @user_1.id, party_id: @party_2.id)
      create(:user_parties, user_id: @user_1.id, party_id: @party_3.id)
      create(:user_parties, user_id: @user_2.id, party_id: @party_4.id)
      create(:user_parties, user_id: @user_2.id, party_id: @party_5.id)
      create(:user_parties, user_id: @user_3.id, party_id: @party_6.id)
      create(:user_parties, user_id: @user_3.id, party_id: @party_7.id)

    end

    it 'shows users name at the top of the page' do
      visit user_path(@user_1)
      expect(page).to have_content("#{@user_1.name}'s Dashboard")

      visit user_path(@user_2)
      expect(page).to have_content("#{@user_2.name}'s Dashboard")
    end

    it 'has a button to discover movies' do
      visit user_path(@user_1)
      click_button "Discover Movies"
      expect(current_path).to eq(user_discover_path(@user_1))

      visit user_path(@user_2)
      click_button "Discover Movies"
      expect(current_path).to eq(user_discover_path(@user_2))
    end

    it 'has a section for users current viewing parties' do
        visit user_path(@user_1)
  
        within("#party-#{@party_1.id}") do
          expect(page).to have_content(@party_1.id)
        end
        within("#party-#{@party_2.id}") do
          expect(page).to have_content(@party_2.id)
        end
        within("#party-#{@party_3.id}") do
          expect(page).to have_content(@party_3.id)
        end
  
        visit user_path(@user_2)
  
        within("#party-#{@party_4.id}") do
          expect(page).to have_content(@party_4.id)
        end
        within("#party-#{@party_5.id}") do
          expect(page).to have_content(@party_5.id)
        end
      
    end

###############
    it 'shows the viewing parties the user has been invited to with details' do
      visit user_path(@user_3)
      within("#attending") do 
        # expect(page).to have_content(PICTUREHERE) #update with API
        expect(page).to have_content(@party_7.start_time) #change to name with API
        expect(page).to have_content(@party_7.date)
        expect(page).to have_content("Host: #{@user_2.name}")
        expect(page).to have_content("Attendees: #{@user_3.name}")
        expect(page).to have_content("Shawshank Redemption")

        expect(page).to_not have_content("King Kong")
      end
        
        click_link "#{@party_1.movie_id}"

      expect(current_path).to eq(movie_path(@party_1.movie_id)) #fix routing
    end

    it 'shows the viewing parties the user has created with details (host)' do
        visit user_path(@user_1)
        within("#hosting") do 

          # expect(page).to have_content(PICTUREHERE) #update with API
          expect(page).to have_content(@party_6.start_time) #change to name with API
          expect(page).to have_content(@party_6.date)
          expect(page).to have_content("Host: #{@user_1.name}") 
          expect(page).to have_content("Attendees: #{@user_3.name}")
          expect(page).to have_content("Flinstones")

          expect(page).to_not have_content(@user_2.name)


        end

        click_link "#{@party_4.movie_id}"

        expect(current_path).to eq(movie_path(@party_4.movie_id)) #fix routing

    end
  end
end
