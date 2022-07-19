require 'rails_helper'

RSpec.describe 'Viewing Partys new page' do
  let!(:users) { create_list(:user, 3)}
  before :each do
    visit new_user_movie_viewing_party_path("#{users[0].id}", 278)
  end

  it 'displays the movies title', :vcr do
    expect(page).to have_content("The Shawshank Redemption")
  end

  it 'has a form I can fill in with fields for duration(with default value of movie runtime), when(field to select date), start time(field to select start time), checkboxes next to each existing user in the system, and button to create party', :vcr do
    expect(page).to have_field("Duration", with: 142)
    fill_in "Duration", with: "150"
    select('2022', from: '_date_1i')
    select('August', from: '_date_2i')
    select('22', from: '_date_3i')
    select('08 PM', from: '_start_time_4i')
    select('45', from: '_start_time_5i')

    within "#user-#{users[0].id}" do
      check
    end

    within "#user-#{users[1].id}" do
      check
    end

    click_button('Create Party')

    expect(current_path).to eq(user_path("#{users[0].id}"))
  end

    it 'can test duration', :vcr do
    expect(page).to have_field("Duration", with: 142)
    fill_in "Duration", with: "140"
    select('2022', from: '_date_1i')
    select('August', from: '_date_2i')
    select('22', from: '_date_3i')
    select('08 PM', from: '_start_time_4i')
    select('45', from: '_start_time_5i')

    within "#user-#{users[0].id}" do
      check
    end

    within "#user-#{users[1].id}" do
      check
    end

    click_button('Create Party')

    expect(current_path).to eq(new_user_movie_viewing_party_path(users[0].id, 278))
  end

end
