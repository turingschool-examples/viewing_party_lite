# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'New Party' do
  before :each do
    @eli = User.create!(name: 'Eli', email: 'es@g', password: 'test', password_confirmation: 'test')
    @sunny = User.create!(name: 'Sunny', email: 'sm@g', password: 'test', password_confirmation: 'test')
    @john = User.create!(name: 'John', email: 'jc@g', password: 'test', password_confirmation: 'test')

    visit new_user_movie_party_path(@eli, 550)
  end

  it 'has form to create party and invite users', vcr: 'movie_details2' do
    expect(page).to have_content('Movie Title: Fight Club')
    fill_in 'Duration', with: '150'
    select('2022', from: '_start_time_1i')
    select('December', from: '_start_time_2i')
    select('25', from: '_start_time_3i')
    select('06 PM', from: '_start_time_4i')
    select('15', from: '_start_time_5i')
    within "#user-#{@sunny.name}" do
      check
    end
    click_button 'Create Party'
    expect(current_path).to eq(user_path(@eli))
    within '#created' do
      within '#created-host' do
        expect(page).to have_content('Host: Eli')
        expect(page).to_not have_content('Host: Sunny')
      end
      within '#created-invited' do
        expect(page).to have_content('Sunny')
        expect(page).to_not have_content('Eli')
      end
    end
  end
end
