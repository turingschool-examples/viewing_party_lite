require 'rails_helper'

RSpec.describe 'user show page', type: :feature do
  before(:each) do
    @kenz = User.create!(name: 'Kenz', email: 'kenz_mail@gmail.com')
    @astrid = User.create!(name: 'Astrid', email: 'astrid_mail@gmail.com')
    @reba = User.create!(name: 'Reba', email: 'reba_mail@gmail.com')
    visit user_path(@reba)
  end

  describe 'as a user' do 
    describe 'when I visit user_path(:id)' do
      it '- shows the users name at the top of the page' do

      end

      it '- has a button to discover movies' do

      end

      it '- has a section that lists viewing parties' do

      end
    end
  end
end

