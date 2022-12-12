require 'rails_helper'
require 'faker'

RSpec.describe 'Users' do
  before(:each) do
    @user_1 = create(:user)
    @user_2 = create(:user)
    @user_3 = create(:user)
    @user_4 = create(:user)
  end

  describe 'index' do
    it 'displays all users', :vcr do
      visit "/users"
      expect(page).to have_content(@user_1.name)
    end
  end
end
