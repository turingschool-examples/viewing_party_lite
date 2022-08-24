require 'rails_helper'

RSpec.describe 'Index', type: :feature do
  it "shows no more than the top 40 results" do

  end

  it "has a title of each movie as a link, that when clicked, takes the user to that movies details page", :vcr do
    user_1 = User.create(name: 'John Doe', email: 'John@gmail.com')

    visit "/users/#{user_1.id}/discover"

    click_button "Top Movies"

    expect(current_path).to eq("/users/#{user_1.id}/movies")

    expect(page).to have_link("Shawshank Redemption")

    click_link "Shawshank Redemption"

    expect(current_path).to eq("/users/#{user_1.id}/movies/278")

    expect(page).to have_content("Shawshank Redemption")

  end
end