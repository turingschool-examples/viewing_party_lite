require 'rails_helper'

RSpec.describe 'Admin login' do
  describe 'happy path' do
    it 'can log in as admin and get to my dashboard' do
      admin = create(:user, role: 2)

      visit login_path
      fill_in :email, with: admin.email
      fill_in :password, with: admin.password
      click_button 'Log In'

      expect(current_path).to eq(admin_dashboard_index_path)
    end
  end

  describe 'sad path' do
    it 'does not allow default user to see admin dashboard index' do
      non_admin = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(non_admin)
      visit admin_dashboard_index_path
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
