require 'rails_helper'

RSpec.describe 'discover page' do 
    it 'has a top rated movies link' do 
        user = User.create!(name: "will", email: "will@g.com")
        visit "/users/#{user.id}/discover"
        click_button 'Top Movies'
        save_and_open_page
        expect(page).to have_content("Top Movies")
        expect(page).to have_content("Shawshank Redemption - 8.7")
        expect(page).to_not have_content("Fight Club")
    end
end