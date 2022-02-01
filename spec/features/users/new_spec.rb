require 'rails_helper'

describe 'New User' do
    let!(user) {User.create!(name: '', email: '')}
    let!(user) {User.create!(name: '', email: '')}
    let!(user) {User.create!(name: '', email: '')}
  
    it 'should be have a button from the landing page' do
        visit root_path

        click_button

        expect(current_path).to eq(new_user_path)
    end

    it "can create a new user with valid input" do
        
    end

    it "has a sad path for invalid data" do
        
    end

    it "has a link to the landing page" do
        visit new_user_path

        click_link 'Home'

        expect(current_path).to eq(root_path)
    end
    
end