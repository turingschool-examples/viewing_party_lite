require 'rails_helper'

RSpec.describe 'movie show page' do
  let!(:user_1) {User.create!(name: "Alfred", email: "alfred@butler.net", status: 0)}
  let!(:user_2) {User.create!(name: "Bruce", email: "bruced@boss.net", status: 0)}
  let!(:user_3) {User.create!(name: "Oswald", email: "oswald@cobblepot.gotham", status: 0)}

  it 'has a link to take the user back to the homepage' do 
    visit user_movie_index_path(user_1)

    click_link "Home"

    expect(current_path).to eq(root_path)
  end

  it 'has a button that takes the user back to the discover page' do 
    visit user_movie_index_path(user_1)

    click_button "Discover Movies"

    expect(current_path).to eq(user_discover_index_path(user_1))
  end
end