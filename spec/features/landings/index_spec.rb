require 'rails_helper'

RSpec.describe 'Landing Page' do
  describe 'user visits landing page' do
    before :each do
      @users_1 = create_list(:user, 20)
    end

    it 'shows landing page information' do
      visit '/'

      expect(page).to have_content("Viewing Party Lite")
      click_button 'Create New User'
      expect(current_path).to eq(new_user_path)

      visit '/'

      within "#users-list" do
        expect(page).to have_content(@users_1[0].name)
        expect(page).to have_content(@users_1[1].name)
      end

      click_link "#{@users_1[0].name}"
      expect(current_path).to eq(user_path(@users_1[0]))
    end
  end
end
