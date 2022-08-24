require 'rails_helper'

RSpec.describe 'users registration page' do
    it 'should have a form to enter name and email' do
        visit "/users/new"

        fill_in('Name', with: 'Nick')
        fill_in('email', with: '123@gmail.com')

        click_on("Create New User")

        expect(current_path).to eq("/users/#{User.last.id}")
    end
end