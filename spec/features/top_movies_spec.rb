require 'rails_helper'

RSpec.describe 'Top Movies' do
  before(:each) do
    @user_1 = User.create!(name: 'John', email: 'x@user.com')
    visit user_discover_path(@user_1)
  end

  it 'returns the titles of top movies' do
    click_button 'Discover Top Rated Movies'

    expect(page.status_code).to eq 200
    expect(page).to have_content("Godfather")
    expect(page).to have_content("Shawshank Redemption")
  end
end