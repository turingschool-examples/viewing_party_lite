require 'rails_helper'

RSpec.describe 'Admin Dashboard', type: :feature do
  let!(:user_1) { create(:user, role: 1)}
  let!(:user_2) { create(:user, role: 1)}
  let!(:user_3) { create(:user)}
  let!(:user_4) { create(:user)}

  before do
    visit login_path
    fill_in :email, with: user_1.email
    fill_in :password, with: user_1.password
    click_button 'Log In'
  end

  describe 'When I visit the admin dashboard' do
    it 'I see a list of all default users email addresses' do
      visit admin_dashboard_path

      within '#existing-users' do
        expect(page).to have_content(user_3.email)
        expect(page).to have_content(user_4.email)
        expect(page).to_not have_content(user_2.email)

        click_link user_3.email
      end
      
      expect(current_path).to eq(admin_path(user_3))
    end
  end
end