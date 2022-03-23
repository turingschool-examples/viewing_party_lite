require 'rails_helper'

RSpec.describe 'Movie results index page' do
  describe 'index page' do
    it 'shows a list of top rated  movies' do
      user = User.create!(name: 'Sam', email: 'sam@supercool.edu')
      visit("/users/#{user.id}/movies?q=top%20rated")
      expect(page).to have_content('The Dark Knight')
    end
  end
end
