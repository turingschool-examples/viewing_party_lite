require 'rails_helper'

RSpec.describe "Popular Movie Search" do
  describe 'happy path' do
    before do
      @user = User.create!(name: "Haewon Jeon", email: "haewon201@gmail.com")
      visit user_discover_index_path(@user)
      click_button "Find Top Rated Movies"
    end

    it 'allows users to search for the 40 most popular movies' do
      expect(page.status_code).to eq(200)
    end
  end
end
