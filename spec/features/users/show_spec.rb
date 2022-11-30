require 'rails_helper'

RSpec.describe 'user show page', type: :feature do
  before(:each) do
    @kenz = User.create!(name: 'Kenz', email: 'kenz_mail@gmail.com')
    @astrid = User.create!(name: 'Astrid', email: 'astrid_mail@gmail.com')
    @reba = User.create!(name: 'Reba', email: 'reba_mail@gmail.com')

    @party_1 = Party.create!(movie_id: 550, duration: 170, date: Date.new(2022,12,20), start_time: Time.new(2022,12,20,18,30,00))
    @party_2 = Party.create!(movie_id: 700, duration: 160, date: Date.new(2022,12,27), start_time: Time.new(2022,12,27,20,00,00))

    @kenz.user_parties << @party_1
    @astrid.user_parties << @party_1
    @astrid.user_parties << @party_2
    @reba.user_parties << @party_2
    
    visit user_path(@reba)
  end

  describe 'as a user' do 
    describe 'when I visit user_path(:id)' do
      it '- has a link to go back to the landing page (this link will be present at the top of all pages)' do
        expect(page).to have_link('Home', href: root_path)
      end

      it '- shows the users name at the top of the page' do
        expect(page).to have_content("Reba's Dashboard")
      end

      it '- has a button to discover movies' do
        expect(page).to have_button('Discover Movies')
        
        click_button 'Discover Movies'

        expect(current_path).to eq(discover_path(@reba))
      end

      xit '- has a section that lists the users viewing parties' do

      end
    end
  end
end

