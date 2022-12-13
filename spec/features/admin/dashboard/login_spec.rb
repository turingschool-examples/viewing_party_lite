require 'rails_helper'

RSpec.describe 'Admin login' do
  describe 'happy path' do
    it 'can log in as admin and get to my dashboard' do
      admin = user = create(:user, role: 2)

      visit login_path
      fill_in :email, with: admin.email
      fill_in :password, with: admin.password
      click_button 'Log In'

      expect(current_path).to eq(admin_dashboard_index_path)
    end
  end
end
