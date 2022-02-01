require 'rails_helper'

describe 'New User' do
    before :each do 
        @eldridge = User.create!(name: 'Eldridge', email: 'eldridge@gmail.com')
        @kevin = User.create!(name: 'Kevin', email: 'kevin@gmail.com')
        @suzie = User.create!(name: 'Suzie', email: 'suzieq@gmail.com')
    end

    it 'should be have a button from the landing page' do
        visit root_path

        click_link 'Create New User'

        expect(current_path).to eq(new_user_path)
    end

    it "can create a new user with valid input" do
        visit new_user_path 

        fill_in(:user_name, with: 'John')
        fill_in(:user_email, with: 'john@gmail.com')
        click_button 'Create User'

        user = User.find_by(name: 'John')
        
        expect(current_path).to eq(user_path(user))
        expect(page).to have_content(user.name)
    end

    it "has a sad path for invalid data" do
        visit new_user_path 

        fill_in(:user_name, with: 'John')
        fill_in(:user_email, with: 'johnnyboy')
        click_button 'Create User'

        user = User.find_by(name: 'John')
        
        expect(current_path).to eq(new_user_path)
        expect(page).to have_content(user.name)
    end

    it "has a link to the landing page" do
        visit new_user_path

        click_link 'Home'

        expect(current_path).to eq(root_path)
    end
    
end