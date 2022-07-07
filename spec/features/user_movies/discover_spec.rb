# frozen_string_literal: true

require 'rails_helper'

describe 'user discover page' do
    before do 
        @user1 = User.create!(name: 'Jane', email: 'eleven@upsidedown.com')
        visit "users/#{@user1.id}/discover"
    end 

    it 'has a button to discover top rated movies' do
        click_button("Find Top Rated Movies")
        
        expect(current_path).to eq("/users/#{@user1.id}/movies")
        #will want to add test to check content of page once API is consumed
    end

    it 'has a text field to enter a keyword and a button to search by movie title '  do
        fill_in 'search', with: "titanic"
        click_button('Find Movies')

        expect(current_path).to eq("/users/#{@user1.id}/movies")
        #will want to add test to check content of page once API is consumed
    end
end