require 'rails_helper'

RSpec.describe 'the Admin dashboard' do 
  before(:each) do 
    @admin = create(:user, role: 1)
    @users = create_list(:user, 5)
    
    visit '/login'
    fill_in 'email', with: @admin.email
    fill_in 'password', with: @admin.password
    click_button 'Log In'
  end

  describe 'logging in' do 
    it 'brings me to admin dashboard after login' do 
      expect(current_path).to eq(admin_dashboard_path)
    end
  end

  describe 'authorization' do 
    it 'errors if a normal user attempts to access admin dashboard' do 
      user = @users.first
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit '/admin/dashboard'
      
      expect(current_path).to eq('/')
      expect(page).to have_content('Error: You are not authorized to view admin pages')
    end
  end

  describe 'layout' do 
    it 'i see a list of all default users emails' do 
      @users.each do |user|
        expect(page).to have_content(user.email)
      end
    end

    it 'when i click on a user, it takes me to the dashboard that user would see' do 
      user = @users.first
      click_link user.email

      expect(current_path).to eq(admin_user_path(user))
      expect(page).to have_content("#{user.name}'s Dashboard")
    end
  end
end