require 'rails_helper'

RSpec.describe "Login Page/Process" do
    before :each do
        @user = User.create!(name: "Satoshi", email: "satoshi@yahoo.com", password: 'nodes', password_confirmation: 'nodes')
    end

    it "has link to login page and user can successfully log in if user already exists" do
        visit root_path
        click_link 'Log In'
        expect(current_path).to eq('/login')
        fill_in :email,	with: "satoshi@yahoo.com" 
        fill_in :password,	with: "nodes"
        click_button 'Log In'
        expect(current_path).to eq(user_path(@user.id))
    end

    it "fails to login if credentials are not put in properly" do
        visit root_path
        click_link 'Log In'
        expect(current_path).to eq('/login')
        fill_in :email,	with: "satoshi@yahoo.com" 
        fill_in :password,	with: "node"
        click_button 'Log In'
        expect(current_path).to eq('/login')
        expect(page).to have_content("Invalid Credentials. Please try again.") 
    end
    
end