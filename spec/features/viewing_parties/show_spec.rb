require 'rails_helper'

RSpec.describe 'Viewing Party Show Page' do 
    before :each do 
        @user_1 = User.create(name: 'Bob', email: 'bob@yahoo.com')
        @user_2 = User.create(name: 'Ron', email: 'ron@yahoo.com')
        @user_3 = User.create(name: 'Sam', email: 'sam@yahoo.com')
        @vp = ViewingParty.create(user: @user_1, movie_id: 550988, duration: 300, date_time: DateTime.now)
        @uvp_1 = UserViewingParty.create(user: @user_2, viewing_party: @vp)
        @uvp_2 = UserViewingParty.create(user: @user_3, viewing_party: @vp)
    end
    it 'will have the start time and end time', :vcr do 
        visit(user_viewing_party_path(@user_1, @vp))
        expect(page).to have_content(@vp.date_time.strftime("%l:%M %p"))
        expect(page).to have_content(@vp.end_time)
    end
    it 'will have a the images and urls to disney and hbo', :vcr do 
        visit(user_viewing_party_path(@user_1, @vp))
   
    end
end