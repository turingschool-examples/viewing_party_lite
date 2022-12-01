require 'rails_helper'

RSpec.describe 'user show page', :vcr, type: :feature do
  before(:each) do
    @kenz = User.create!(name: 'Kenz', email: 'kenz_mail@gmail.com')
    @astrid = User.create!(name: 'Astrid', email: 'astrid_mail@gmail.com')
    @reba = User.create!(name: 'Reba', email: 'reba_mail@gmail.com')

    @party_1 = Party.create!(movie_id: 550, duration: 170, date: Date.new(2022,12,20), start_time: Time.new(2022,12,20,18,30,00))
    @party_2 = Party.create!(movie_id: 700, duration: 160, date: Date.new(2022,12,27), start_time: Time.new(2022,12,27,20,00,00))

    @kenz.parties << @party_1
    @astrid.parties << @party_1
    @astrid.parties << @party_2
    @reba.parties << @party_2

    visit user_path(@reba)
  end

  describe 'as a user' do 
    describe 'when I visit user_path(:id)' do
      it '- shows the users name at the top of the page' do
        expect(page).to have_content("Reba's Dashboard")
      end

      xit '- has a button to discover movies' do
        expect(page).to have_button('Discover Movies')
        
        click_button 'Discover Movies'

        expect(current_path).to eq(discover_path(@reba))
      end

      it '- has a section that lists the users viewing parties' do
        expect(page).to have_css("#viewing-parties")

        within "#viewing-parties" do
          expect(page).to have_content("Octopussy")
          expect(page).to have_content("December 27, 2022")
          expect(page).to have_content("8:00 pm")
        end
      end
    end
  end
end

