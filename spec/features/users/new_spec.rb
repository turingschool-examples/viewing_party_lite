# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'New User Page', type: :feature do
  describe 'happy path' do
    it 'filling in the form correctly redirects me to my new user dashboard/show page' do
      visit '/register'
      fill_in :user_name, with: 'skeeter'
      fill_in :user_email, with: 'skeeter@example.com'
      fill_in :user_password, with: 'password'
      fill_in :user_password_confirmation, with: 'password'
      click_on 'Create User'

      new_user = User.last
      expect(current_path).to eq("/users/#{new_user.id}")
    end

  end 
end

# within '#new-user-form' do
#   fill_in :name,	with: 'Zel'
#   fill_in :email, with: 'lorem@ipsum.dorum'
#   click_on :submit
# end

# new_user = User.where(email: 'lorem@ipsum.dorum').first
# expect(current_path).to eq("/users/#{new_user.id}")