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
    end
  end