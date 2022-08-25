require 'rails_helper'

RSpec.describe 'User Dashboard page' do
    context "When I visit '/users/:id' where :id is a valid user id" do
        before :each do
            @user1 = User.create!(name: 'Jared', email: 'jared@example.com')
            @party1 = Party.create!(movie_id: 199, duration: 100, date: )
            visit "/users/#{@user1.id}"
        end

        it "'<user's name>'s Dashboard' is at the top of the page" do    
            expect(page).to have_content("#{@user1.name}'s Dashboard")
        end
        
        it 'there is a button to Discover Movies' do 
            expect(page).to have_button("Discover Movies")
        end
        
        it "and when I click the Discover Movies button,
        I am redirected to a discover page '/users/:id/discover'
        where :id is the user id of the user whose dashboard I was just on" do
        click_button("Discover Movies")
        expect(current_path).to eq("/users/#{@user1.id}/discover")
        end
    
        it 'there is a section that lists viewing parties' do
            expect(page).to have_content("Viewing Parties")
        end

        it 'and the viewing parties have the following details:
        movie image, 
        movie title (which links to thte movie show page),
        date and time of event,
        who is hosting the event,
        and list of users invited, with my name in bold' do 
            expect(page).to have_content()
        end

        it 'I should also see the viewing parties that I (the user) has created
        with the following details:
        movie image,
        movie title (which links to thte movie show page),
        date and time of event,
        that I am the host of the party,
        and a list of friends invited to the viewing party' do 

        end
    end
end