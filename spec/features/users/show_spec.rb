require 'rails_helper'

RSpec.describe 'User Show Page' do 
    before :each do 
        @user_1 = User.create!(name: 'Ron', email: 'ron@yahoo.com')
        @user_2 = User.create!(name: 'Bob', email: 'bob@yahoo.com')
    end
    it 'will show a user show page' do 
        visit(user_path(@user_1))
        expect(page).to have_content("Ron's Dashboard")
    end
    describe 'viewing parties' do 
        before :each do 
            @vp1 = ViewingParty.create!(user: @user_1, movie_id: 143, date_time: DateTime.now)
            @vp2 = ViewingParty.create!(user: @user_1, movie_id: 144, date_time: Date.yesterday)
            @uvp = UserViewingParty.create!(user: @user_2, viewing_party: @vp1)
        end
        it 'will show upcoming viewing parties', :vcr do 
            visit(user_path(@user_1))
            within "##{0}" do 
                expect(page).to have_content("Hosting")
                expect(page).to have_content("Date")
            end
        end
        it 'will show invited when user is not host', :vcr do 
            visit(user_path(@user_2))
            within "##{0}" do 
                expect(page).to have_content("Invited")
            end
        end
    end
end