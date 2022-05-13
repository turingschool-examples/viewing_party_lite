require 'rails_helper'

RSpec.describe 'a users new party creation page' do
  it 'displays the name of the movie title' do
    user_1 = User.create!(name: 'Will', email: '123@mail.com')

    visit "/users/#{user_1.id}/movies/278/viewing-party/new"

    expect(page).to have_content('The shawshank redemption')
  end

  it 'has a form with fields for duration, day, and start time' do
    user_1 = User.create!(name: 'Will', email: '123@mail.com')

    visit "/users/#{user_1.id}/movies/278/viewing-party/new"

    expect(page).to have_field(:duration)
    expect(page).to have_field(:date)
    expect(page).to have_field(:start_time)
  end

  it 'has checkboxes for all the registered users' do
    user_1 = User.create!(name: 'Will', email: '123@mail.com')
    user_2 = User.create!(name: 'Charles', email: 'abc@mail.com')
    user_3 = User.create!(name: 'Dylan', email: 'xyz@mail.com')
    user_4 = User.create!(name: 'Samantha', email: 'sam@mail.com')

    visit "/users/#{user_1.id}/movies/278/viewing-party/new"

    expect(page).to have_no_content('Will')
    expect(page).to have_content('Charles')
    expect(page).to have_content('Dylan')
    expect(page).to have_content('Samantha')
    expect(page).to have_no_content("#{user_1.email}")
    expect(page).to have_content("#{user_2.email}")
    expect(page).to have_content("#{user_3.email}")
    expect(page).to have_content("#{user_4.email}")
  end

  it 'creates a new party' do
    user_1 = User.create!(name: 'Will', email: '123@mail.com')
    user_2 = User.create!(name: 'Charles', email: 'abc@mail.com')
    user_3 = User.create!(name: 'Dylan', email: 'xyz@mail.com')
    user_4 = User.create!(name: 'Samantha', email: 'sam@mail.com')

    visit "/users/#{user_1.id}/movies/278/viewing-party/new"
    fill_in :duration, with: '142'
    fill_in :date, with: Date.current
    fill_in :start_time, with: '00:54 PM'
    within "#user-#{user_2.id}" do
      check
    end

    click_button "Create Party"

    expect(current_path).to eq("/users/#{user_1.id}")
  end

  it 'flash messages' do
    user_1 = User.create!(name: 'Will', email: '123@mail.com')
    user_2 = User.create!(name: 'Charles', email: 'abc@mail.com')
    user_3 = User.create!(name: 'Dylan', email: 'xyz@mail.com')
    user_4 = User.create!(name: 'Samantha', email: 'sam@mail.com')

    visit "/users/#{user_1.id}/movies/278/viewing-party/new"
    fill_in :duration, with: '140'
    fill_in :date, with: Date.current
    fill_in :start_time, with: '00:54 PM'

    click_button "Create Party"

    expect(current_path).to eq("/users/#{user_1.id}/movies/278/viewing-party/new")
    expect(page).to have_content("Party can't be shorter than Movie's runtime.")

    fill_in :duration, with: '142'
    fill_in :start_time, with: '00:54 PM'

    click_button "Create Party"

    expect(current_path).to eq("/users/#{user_1.id}/movies/278/viewing-party/new")
    expect(page).to have_content("Please fill out all fields")

    fill_in :duration, with: '142'
    fill_in :date, with: Date.current

    click_button "Create Party"

    expect(current_path).to eq("/users/#{user_1.id}/movies/278/viewing-party/new")
    expect(page).to have_content("Please fill out all fields")
  end
end
