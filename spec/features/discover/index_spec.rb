require 'rails_helper'

RSpec.describe 'viewing party homepage' do
  let!(:user_1) {User.create!(name: "Alfred", email: "alfred@butler.net", status: 0)}
  let!(:user_2) {User.create!(name: "Bruce", email: "bruced@boss.net", status: 0)}
  let!(:user_3) {User.create!(name: "Oswald", email: "oswald@cobblepot.gotham", status: 0)}

  it 'has a discover movies header' do 
    visit user_discover_index_path(user_1)

    expect(page).to have_content("Discover Movies")
  end
end 