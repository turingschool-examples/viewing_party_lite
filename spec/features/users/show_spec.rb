require 'rails_helper'

RSpec.describe 'User Dashboard Page' do
  describe 'user visits the dashboard page' do
    before :each do
      @user_1 = create(:user)
      @user_2 = create(:user)

      @party_1 = create(:party)
      @party_2 = create(:party)
      @party_3 = create(:party)
      @party_4 = create(:party)
      @party_5 = create(:party)

      create(:user_parties, user_id: @user_1.id, party_id: @party_1.id)
      create(:user_parties, user_id: @user_1.id, party_id: @party_2.id)
      create(:user_parties, user_id: @user_1.id, party_id: @party_3.id)
      create(:user_parties, user_id: @user_2.id, party_id: @party_4.id)
      create(:user_parties, user_id: @user_2.id, party_id: @party_5.id)
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

#     As a user,
# When I visit a user dashboard,
# I should see the viewing parties that the user has been invited to with the following details:

# Movie Image
# Movie Title, which links to the movie show page
# Date and Time of Event
# who is hosting the event
# list of users invited, with my name in bold


  it 'shows the viewing parties the user has been invited to with details' do
    visit user_path(@user_1)
    require 'pry'; binding.pry
    # expect(page).to have_content(PICTUREHERE) #update with API
    expect(page).to have_content(@party_1.movie_id) #change to name with API
    expect(page).to have_content(@party_1.duration)
    expect(page).to have_content("Host: #{@user_1.name}")
    ##test for invitees

    click_link "#{@party_1.movie_id}"

    expect(current_path).to eq(movie_path(@party_1.movie_id)) #fix routing

  end

# I should also see the viewing parties that the user has created with the following details:

# Movie Image
# Movie Title, which links to the movie show page
# Date and Time of Event
# That I am the host of the party
# List of friends invited to the viewing party
    it 'shows the viewing parties the user has created with details' do
          visit user_path(@user_2)
        # expect(page).to have_content(PICTUREHERE) #update with API
        expect(page).to have_content(@party_4.movie_id) #change to name with API
        expect(page).to have_content(@party_4.duration)
        expect(page).to have_content("Host: #{@user_2.name}") 
        ##test for invitees

        click_link "#{@party_4.movie_id}"

        expect(current_path).to eq(movie_path(@party_4.movie_id)) #fix routing

    end
  end
end
