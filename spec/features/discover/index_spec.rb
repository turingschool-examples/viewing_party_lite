require 'rails_helper'

describe 'Discover Page' do
    before :each do 
        @eldridge = User.create!(name: 'Eldridge', email: 'eldridge@gmail.com')
        @kevin = User.create!(name: 'Kevin', email: 'kevin@gmail.com')
        @suzie = User.create!(name: 'Suzie', email: 'suzieq@gmail.com')
    end

    it 'should list out all users' do
        visit user_discover_index_path(@kevin)

        expect(page).to have_content("Viewing Party Lite")
        expect(page).to have_content("Discover Movies")
    end
end