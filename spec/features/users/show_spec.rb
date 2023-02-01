  require 'rails_helper'

  RSpec.describe 'User Dashboard Page' do
    describe 'dispay information' do
      before :each do
        @user = create(:user)
        visit user_path(@user)
      end
      it 'displays username at top of page' do
        expect(page).to have_content("#{@user.name}'s Dashboard")
      end

      it 'displays button to Discover Movies Page' do
        expect(page).to have_button('Discover Movies')

        click_button('Discover Movies')

        expect(current_path).to eq("/users/#{@user.id}/discover")
      end
    end
  end