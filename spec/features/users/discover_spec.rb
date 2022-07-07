require 'rails_helper'

RSpec.describe 'Movies Discover Page', type: :feature do
  let!(:users) { create_list(:user, 3)}
  let!(:viewing_party) { create(:viewing_party)}

  it 'has a button to discover top rated movies' do
    visit "/users/#{users[0].id}/discover"

    click_button('Top Rated Movies')
    expect(current_path).to eq("users/#{users[0].id}/movies?q=top%20rated")
  end
end