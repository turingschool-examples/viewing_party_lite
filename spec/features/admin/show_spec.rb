# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin Show Page', type: :feature do
  let!(:user_1) { create(:user, role: 1) }
  let!(:user_2) { create(:user) }
  let!(:user_3) { create(:user) }

  describe 'When I visit the admin show page' do
    it 'as a visitor, I am taken back to the landing page where I see an error' do
      visit login_path
      fill_in :email, with: user_2.email
      fill_in :password, with: user_2.password
      click_button 'Log In'

      visit admin_path(user_3)

      expect(current_path).to eq(root_path)
      expect(page).to have_content('You must be admin to access the previous page')
    end
  end
end
