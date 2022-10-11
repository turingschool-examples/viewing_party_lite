require 'rails_helper'
require 'faker'

RSpec.describe "User Show Page" do
    describe "As a user when I visit the show page" do
        it 'Has my username' do
            @user = create(:user)
            visit user_path(@user)

            expect(page).to have_content(@user.user_name)
        end

        it 'has a button to Discover Movies' do
          @user = create(:user)
        end

        describe 'viewing parties invited to list' do
          it 'shows viewing parties user has been invited to' do

          end

          describe 'each viewing party contains' do
            it 'has a movie title that is a link to movie show page' do

            end

            it 'has date and time of event' do
              
            end

            it 'has the host username' do

            end

            it 'has a list of invited users' do

            end

            it 'within list of invited users, user name is in bold' do

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