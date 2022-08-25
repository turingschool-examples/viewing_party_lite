# require 'rails_helper'
#
# RSpec.describe 'Movie Search' do
#   it 'allows users to search for movies', :vcr do
#     @user1 = User.create!(name: "Jim Bob", email: "jimb@viewingparty.com")
#
#     visit user_discover_path(@user1.id)
#
#     fill_in "Search", with: "Something"
#     click_button "Find Movies"
#     expect(page.status_code).to eq(200)
#     expect(page).to have_content("Something Borrowed")
#
#   end
# end
