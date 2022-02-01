require 'rails_helper'

describe 'User Show Page' do
    before :each do
        @eldridge = User.create!(name: 'Eldridge', email: 'eldridge@gmail.com')
        @kevin = User.create!(name: 'Kevin', email: 'kevin@gmail.com')
        @suzie = User.create!(name: 'Suzie', email: 'suzieq@gmail.com')
    end

    it 'should have the users name' do
        visit user_path(@eldridge)

        expect(page).to have_content("#{@eldridge.name}'s Dashboard")
        expect(page).to_not have_content("#{@kevin.name}'s Dashboard")
    end

    it "has a button to discover movies" do
        visit user_path(@eldridge)

        click_on 'Discover Movies'

        expect(current_path).to eq(user_discover_index_path(@eldridge))
    end

    it "links to show page from landing page" do
        visit root_path

        click_link "#{@eldridge.name} | #{@eldridge.email}"

        expect(current_path).to eq(user_path(@eldridge))
    end

end
