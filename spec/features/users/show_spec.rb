  require 'rails_helper'

  RSpec.describe 'User Dashboard Page' do
    describe 'dispay information' do
      before :each do
        @user = create(:user)
        @other_user = create(:user)
        @another_user = create(:user)
        @viewing_party1 = ViewingParty.create(user_id: @user.id, movie_id: 1, runtime: 1, duration: 2,
          start_time: Time.now, day: Date.tomorrow, title: "Hosting Movie Title", poster_path: "/9Baumh5J9N1nJUYzNkm0xsgjpwY.jpg")

        @viewing_party2 = ViewingParty.create(user_id: @other_user.id, movie_id: 4, runtime: 20, duration: 20, 
          start_time: Time.now, day: Date.tomorrow, title: "Invited Movie Title", poster_path: "/hVIKyTK13AvOGv7ICmJjK44DTzp.jpg")

        @viewing_party_user1 = ViewingPartyUser.create(user_id: @other_user.id, viewing_party_id: @viewing_party1.id)
        @viewing_party_user2 = ViewingPartyUser.create(user_id: @user.id, viewing_party_id: @viewing_party2.id)
        @viewing_party_user3 = ViewingPartyUser.create(user_id: @another_user.id, viewing_party_id: @viewing_party2.id)

        visit user_path(@user)
      end
      it 'displays username at top of page' do
        expect(page).to have_content("#{@user.name}'s Dashboard")
      end

      it 'displays button to Discover Movies Page' do
        expect(page).to have_button('Discover Movies')

        click_button('Discover Movies')

        expect(current_path).to eq("/users/#{@user.id}/discover")
      end

      it 'has section for viewing parties' do
        within '#viewing-parties' do
          within '#invited' do
            save_and_open_page
            expect(page).to have_content("Invited")
            expect(page).to have_content(@viewing_party2.day)
            expect(page).to have_content(@viewing_party2.title)
            expect(page).to have_content(@viewing_party2.duration)
          end
          
          within '#hosting' do
            expect(page).to have_content("Hosting")
            expect(page).to have_content(@viewing_party1.day)
            expect(page).to have_content(@viewing_party1.title)
            expect(page).to have_content(@viewing_party1.duration)
          end
        end
      end
    end
  end