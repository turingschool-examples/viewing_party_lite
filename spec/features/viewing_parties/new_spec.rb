require 'rails_helper'

RSpec.describe 'The new viewing party page' do
  it "exists and has a movie title" do
    User.destroy_all
    user1 = User.create!(name: 'user1', email: 'user1@email.com')

    VCR.use_cassette('new_party_movie') do
      visit "/users/#{user1.id}/movies/24126/viewing_party/new"
      expect(current_path).to eq("/users/#{user1.id}/movies/24126/viewing_party/new")

      within '#title' do
        expect(page).to have_content("Warlock: The Armageddon")
      end
    end
  end

  it "has a form a user can fill out to make a viewing party" do
    User.destroy_all
    user1 = User.create!(name: 'user1', email: 'user1@email.com')
    user2 = User.create!(name: 'user2', email: 'user2@email.com')
    user3 = User.create!(name: 'user3', email: 'user3@email.com')
    user4 = User.create!(name: 'user4', email: 'user4@email.com')

    VCR.use_cassette('new_party_movie') do
      visit "/users/#{user1.id}/movies/24126/viewing_party/new"

      within '#form' do
        check "#{user1.name}"
        check "#{user3.name}"
        click_button('Create')
      end
      expect(current_path).to eq("/users/#{user1.id}")
    end
  end
end
