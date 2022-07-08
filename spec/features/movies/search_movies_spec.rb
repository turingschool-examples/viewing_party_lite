require 'rails_helper'

RSpec.describe 'Search Movies' do
  it 'shows movies based on search' do
    user = User.create!(name: "Bernie", email: "bernie@gmail.com")
    visit user_movies_discover_path(user)

    fill_in 'query', with: 'Harry'
    click_button 'Search'
    expect(current_path).to eq("/users/#{user.id}/movies_search")
    expect(page.status_code).to eq 200
    within "#movie-0" do
      expect(page).to have_link("Harry Potter and the Philosopher's Stone")
      expect(page).to have_content("Average Rating: 7.9")
    end
    within "#movie-2" do
      expect(page).to have_link("Harry Potter and the Chamber of Secrets")
      expect(page).to have_content("Average Rating: 7.7")
    end
    within "#movie-39" do
      expect(page).to have_link("Harry Price: Ghost Hunter")
      expect(page).to have_content("Average Rating: 5.7")
    end
  end
end