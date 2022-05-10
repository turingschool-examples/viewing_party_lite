# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'New User Page', type: :feature do
  it 'Allows a new user to be created' do
    visit '/users/new'

    within '#new-user-form' do
      fill_in :name,	with: 'Zel'
      fill_in :email, with: 'lorem@ipsum.dorum'
      click_on :submit
    end

    new_user = User.where(email: 'lorem@ipsum.dorum').first
    expect(current_path).to eq("/users/#{new_user.id}")
  end
end
