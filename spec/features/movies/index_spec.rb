require 'rails_helper'

RSpec.describe 'Movies Index Page' do

  before do
    visit "/register"

    fill_in 'Name:', with: "Drew"
    fill_in 'Email:', with: "drew@email.com"
    click_button("Create New User")
    user = User.last

    visit "/users/#{user.id}/movies"
  end

  it 'can create new user' do
    save_and_open_page
    # expect(page).to
  end
end
