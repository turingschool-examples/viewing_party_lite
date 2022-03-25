require 'rails_helper'
RSpec.describe 'new viewing party' do 
    before :each do 
        @user_1 = User.create(name: 'Test1', email: 'test1@yahoo.com')
        @user_2 = User.create(name: 'Test2', email: 'test2@yahoo.com')
        movie = MovieFacade.movie(235)
        visit(user_movie_path(@user_1, 235))
        click_button("Create Viewing Party for Stand by Me")
    end
    it 'will have all the required fields', :vcr do
        expect(page).to have_field("duration")
        check('Test2')
        expect(page).to have_field('date_time')
    end
    it 'will send a flash message if a field is missing', :vcr do 
        check('Test2')
        click_button('Create Viewing Party')
        expect(page).to have_content("Date time can't be blank")
    end
    describe 'duration' do 
        it 'will autopopulate duration with time of movie', :vcr do 
            expect(page).to have_field('duration', with: 89)
        end
        it 'will throw an error if duration is lower than runtime of movie', :vcr do 
            fill_in('duration', with: 10)
            click_button('Create Viewing Party')
            expect(page).to have_content("Date time can't be blank")
            expect(page).to have_content("Duration must be greater than or equal to 89")
        end
    end
    describe 'successful submissions' do 
        it 'will make a viewing party without other guests', :vcr do 
            fill_in('date_time', with: DateTime.now)
            click_button('Create Viewing Party')
            expect(page).to have_content("Your Viewing Party was successfully created.")
            expect(current_path).to eq(user_path(@user_1))
            expect(page).to have_content('Stand by Me')
        end
        it 'will make a user_viewing_party for invited guests', :vcr do 
            fill_in('date_time', with: DateTime.now)
            check('Test2')
            click_button('Create Viewing Party')
            visit(user_path(@user_2))
            expect(page).to have_content("Stand by Me")
        end
    end
end