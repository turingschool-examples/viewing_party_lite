require 'rails_helper'
require 'faker'

RSpec.describe "User Show Page" do
    describe "As a user when I visit the show page" do
        it 'Has my username' do
            @user = create(:user)
            visit user_path(@user)

            expect(page).to have_content(@user.user_name)
        end

        it 'has a button to Discover Movies which leads to the discover page' do
          @user = create(:user)
          visit user_path(@user)

          click_button("Discover Movies")
          expect(current_path).to eq(user_discover_path(@user))
        end

        describe 'viewing parties invited to list' do
          before :each do
            Faker::UniqueGenerator.clear
            @user = create(:user)
            @awesome_host = create(:user)
            @other_user = create(:user)
            #create 4 viewing parties each hosted by awesome_host
            @viewing_party_invites = create_list(:viewing_party, 4, host: @awesome_host.user_name)
            #creates 5 viewing_party_users, three rando invites, one for the user and one for the host for each viewing party
            @viewing_party_invites.each do |viewing_party|
              create_list(:viewing_party_user, 3, viewing_party: viewing_party)
              create(:viewing_party_user, viewing_party: viewing_party, user: @user)
              create(:viewing_party_user, viewing_party: viewing_party, user: @awesome_host)
            end
            #create 4 viewing parties each hosted by user
            @viewing_party_hosting = create_list(:viewing_party, 4, host: @user.user_name)
            #creates 4 viewing_party_users, three rando invites, one for the user for each viewing party
            @viewing_party_hosting.each do |viewing_party|
              create_list(:viewing_party_user, 3, viewing_party: viewing_party)
              create(:viewing_party_user, viewing_party: viewing_party, user: @user)
            end
            #creates viewing party not associated with the user with three rando invites
            @other_viewing_party = create(:viewing_party, host: @other_user.user_name)
            create_list(:viewing_party_user, 3, viewing_party: @other_viewing_party)
            #creates viewing party where only the user is invited
            @lonely_viewing_party = create(:viewing_party, host: @user.user_name)
            create(:viewing_party_user, viewing_party: @lonely_viewing_party, user: @user)
            visit user_path(@user)
          end
          context 'when invited to a viewing party' do
            it 'shows that viewing party on page' do
              within "#invited_parties" do
                @viewing_party_invites.each do |party|
                  within "party_#{party.id}" do
                    expect(page).to have_content(party.movie_title)
                  end
                end
              end
            end
          end
          context 'when not invited to a viewing party' do
            it 'doesnt show that viewing party on the page' do
              within "#invited_parties" do
                expect(page).to_not have_css("party_#{@other_viewing_party.id}")
              end
            end
          end

          describe 'each viewing party contains' do
            it 'has a movie title that is a link to movie show page' do
              within "#invited_parties" do
                @viewing_party_invites.each do |party|
                  within "party_#{party.id}" do
                    expect(page).to have_content(party.movie_title)
                  end
                end
              end
            end

            it 'has date and time of event' do
              within "#invited_parties" do
                @viewing_party_invites.each do |party|
                  within "party_#{party.id}" do
                    expect(page).to have_content(party.start_time.to_date)
                    expect(page).to have_content(party.start_time.strftime("%I:%M %p"))
                  end
                end
              end
            end

            it 'has the host username' do
              within "#invited_parties" do
                @viewing_party_invites.each do |party|
                  within "party_#{party.id}" do
                    within "host" do
                      expect(page).to have_content(party.host)
                    end
                  end
                end
              end
            end

            it 'has a list of invited users' do
              within "#invited_parties" do
                @viewing_party_invites.each do |party|
                  within "party_#{party.id}" do
                    within "invited_users" do
                      expect(page).to have_content(party.invited_users)
                    end
                  end
                end
              end
            end

            it 'within list of invited users, user name is in bold' do

            end

            it 'says Invited' do

            end

            it 'has a movie image' do

            end
          end

        end

        describe 'viewing parties hosting list' do
          it 'shows viewing parties user is hosting' do

          end

          describe 'each viewing party contains' do
            it 'has a movie title that is a link to movie show page' do

            end

            it 'has date and time of event' do
              
            end

            it 'says that the user is the host' do

            end

            it 'says Invited' do

            end

            it 'has a list of invited users' do

            end

            context 'if no users are invited' do

            end

            it 'has a movie image' do

            end
          end

        end
    end
end