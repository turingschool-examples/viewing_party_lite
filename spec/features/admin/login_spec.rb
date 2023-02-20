require 'rails_helper'

describe 'Admin Login' do
  describe 'happy path login' do
    it 'can log in as an admin and get to my dashboard' do
      admin = create(:user, role: 1)
      user_1 = create(:user, role: 0)
      user_2 = create(:user, role: 0)
      
      visit root_path

      click_on("I already have an account")
      expect(current_path).to eq('/login')

      fill_in('Email', with: "#{admin.email}")
      fill_in('Password', with: "#{admin.password}")
      click_on("Log In")

      expect(current_path).to eq(admin_dashboard_path)
      expect(page).to have_content("Welcome to your Admin Dashboard, #{admin.name}!")
      
      expect(page).to have_link("#{user_1.name}")
      expect(page).to have_link("#{user_2.name}")

      click_on("#{user_1.name}")
      expect(current_path).to eq(dashboard_path)
    end
  end

  describe 'as a default user' do
    it 'does not allow default user to see admin dashboard index' do
      user = create(:user, role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/admin/dashboard'

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end