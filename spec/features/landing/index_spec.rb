require 'rails_helper'

describe 'Landing Page' do
    let!(eldridge) {User.create!(name: 'Eldridge', email: 'eldridge@gmail.com')}
    let!(kevin) {User.create!(name: 'Kevin', email: 'kevin@gmail.com')}
    let!(suzie) {User.create!(name: 'Suzie', email: 'suzieq@gmail.com')}
  
    it 'should list out all users' do
        visit root_path

        expect(page).to have_content(eldridge.name)
        expect(page).to have_content(kevin.name)
        expect(page).to have_content(suzie.name)
    end

    it "has a link to the landing page" do
        visit new_user_path

        click_link 'Home'

        expect(current_path).to eq(root_path)
    end
end