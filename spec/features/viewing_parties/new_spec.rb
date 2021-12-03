# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'viewing party new page' do
  before(:each) do
    @user1 = create(:user)
    @user2 = create(:user)
    @user3 = create(:user)
    visit "/users/#{@user1.id}/movies/566525/viewing_parties/new"
  end

  it 'requires you to fill out all fields of the form' do
    find_field('day')[:required] == 'true'
    find_field('start_time')[:required] == 'true'
  end

  it 'doesnt allow you to submit form if party duration is less than runtime' do
    fill_in 'duration_of_party', with: 20
    fill_in "day", with: "2021/12/25"
    fill_in "start_time", with: "03:30 PM"
    click_button('Save')
    expect(page).to have_content('Viewing Party duration must be equal to or exceed movie runtime!')
    expect(current_path).to eq("/users/#{@user1.id}/movies/566525/viewing_parties/new")
  end

  it 'adds users to the party if they are checked' do
    fill_in 'duration_of_party', with: 240
    fill_in "day", with: "2021/12/25"
    fill_in "start_time", with: "03:30 PM"
    check "user_ids_#{@user2.id}"
    click_button('Save')
    expect(current_path).to eq("/users/#{@user1.id}")
    expect(UserParty.all).to include(UserParty.find_by(user_id: @user2.id))
  end
end
