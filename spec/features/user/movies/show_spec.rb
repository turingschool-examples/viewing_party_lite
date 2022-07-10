require 'rails_helper'

RSpec.describe "Movie details/show page", type: :feature do
  before :each do
    @user1 = User.create!(name: 'Sai', email: 'SaiLent@overlord.com')
    @user2 = User.create!(name: 'Parker', email: 'GriffithDidNothing@Wrong.com')
  end

  it 'has button to create a viewing party', :vcr do
    visit "/users/#{@user1.id}/movies/238"

    expect(page).to have_button("Create Viewing Party")
    expect(page).to have_button("Discover Page")
  end
end
