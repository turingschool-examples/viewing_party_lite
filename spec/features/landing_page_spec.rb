require 'rails_helper'

RSpec.describe 'landing page' do 
    before :each do 
        
        @user1 = User.create!(name: 'Jared', email: 'jared@example.com')
        @user2 = User.create!(name: 'John', email: 'john@example.com')
        @user3 = User.create!(name: 'James', email: 'james@example.com')
        visit '/'
    end

    it 'has the title of application' do 
        expect(page).to have_content("Viewing Party Lite")
    end 

    it 'has a button to add new user' do
        expect(page).to have_link('Add User')
        

        click_link 'Add User'
    end

    it 'has a list of existing users which links to the users dashboard' do 

        expect(page).to have_content(@user1.name)
        expect(page).to have_content(@user2.name)
        expect(page).to have_content(@user3.name)

        click_link "John"
        expect(current_path).to eq("/users/#{@user2.id}")
    end 

    it 'has link to go back to the landing page' do 
        
        expect(page).to have_link("Landing Page")
    end

end