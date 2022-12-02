# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'the user show page' do
  before :each do
    @mostafa = User.create!(name: 'Mostafa', email: 'sasa2020@hotmail.com')
    @yuji = User.create!(name: 'Yuji', email: 'yuyuhakusho2020@hotmail.com')
    @bryan = User.create!(name: 'Bryan', email: 'breakingbad2020@hotmail.com')

    @party_1 = @mostafa.parties.create!(movie_title: 'The Godfather', duration: 175, date: '1/12/2022', time: '19:00',
                                        host_id: @mostafa.id, movie_poster: 'https://image.tmdb.org/t/p/original/3bhkrj58Vtu7enYsRolD1fZdja1.jpg')
    @party_2 = @mostafa.parties.create!(movie_title: 'Young Adam', duration: 93, date: '4/12/2022', time: '18:00',
                                        host_id: @mostafa.id, movie_poster: 'https://image.tmdb.org/t/p/original/3bhkrj58Vtu7enYsRolD1fZdja1.jpg')
    @party_3 = @mostafa.parties.create!(movie_title: 'Natural Born Killers', duration: 118, date: '7/12/2022',
                                        time: '20:00', host_id: @mostafa.id, movie_poster: 'https://image.tmdb.org/t/p/original/3bhkrj58Vtu7enYsRolD1fZdja1.jpg')
    @party_4 = @yuji.parties.create!(movie_title: 'Pulp Fiction', duration: 154, date: '8/12/2022', time: '19:30',
                                     host_id: @yuji.id, movie_poster: 'https://image.tmdb.org/t/p/original/3bhkrj58Vtu7enYsRolD1fZdja1.jpg')
    @party_5 = @bryan.parties.create!(movie_title: 'Up', duration: 96, date: '8/12/2022', time: '17:00',
                                      host_id: @bryan.id, movie_poster: 'https://image.tmdb.org/t/p/original/3bhkrj58Vtu7enYsRolD1fZdja1.jpg')

    @yuji_party_1 = UserParty.create(user_id: @yuji.id, party_id: @party_1.id)
    @yuji_party_2 = UserParty.create(user_id: @yuji.id, party_id: @party_2.id)
    @bryan_party_1 = UserParty.create(user_id: @bryan.id, party_id: @party_1.id)
    @bryan_party_3 = UserParty.create(user_id: @bryan.id, party_id: @party_3.id)
    @mostafa_party_5 = UserParty.create(user_id: @mostafa.id, party_id: @party_5.id)
  end

  it "has <user's name>'s Dahsboard at the top of the page" do
    visit "/users/#{@yuji.id}"

    expect(page).to have_content("Yuji's Dashboard")
    expect(page).to_not have_content("Bryan's Dashboard")

    visit "/users/#{@bryan.id}"

    expect(page).to have_content("Bryan's Dashboard")
    expect(page).to_not have_content("Yuji's Dashboard")
  end

  it 'has a button to discover movies' do
    visit "/users/#{@yuji.id}"

    expect(page).to have_button('Discover Movies')

    click_button 'Discover Movies'

    expect(current_path).to eql("/users/#{@yuji.id}/discover")
  end

  it 'has a section for viewing parties' do
    visit "/users/#{@yuji.id}"

    expect(page).to have_content('Viewing Parties')
  end

  it "has a section for the user's hosted parties with information on each party" do
    visit "/users/#{@mostafa.id}"

    within '#hosted_parties' do
      within "##{@party_1.id}" do
        expect(page).to have_link('The Godfather')
        expect(page).to_not have_link('Young Adam')
        expect(page).to_not have_link('Natural Born Killers')
        expect(page).to have_content('Host: Mostafa')
        expect(page).to have_content('Users Invited:')
        expect(page).to have_content('Yuji')
        expect(page).to have_content('Bryan')
        expect(page).to have_content('Date: 12/01/2022')
        expect(page).to have_content('Time: 7:00 pm')
        expect(page).to have_css("img[src*='image.tmdb.org/t/p/original']")
      end
      expect(page).to have_link('Young Adam')
      expect(page).to have_link('Natural Born Killers')
      expect(page).to_not have_link('Up')
    end

    within '#invited_parties' do
      expect(page).to_not have_link('The Godfather')
      expect(page).to_not have_link('Young Adam')
      expect(page).to_not have_link('Natural Born Killers')
    end
  end

  it "has a section for the user's hosted parties with information on each party" do
    visit "/users/#{@mostafa.id}"

    within '#invited_parties' do
      expect(page).to_not have_link('The Godfather')
      expect(page).to_not have_link('Young Adam')
      expect(page).to_not have_link('Natural Born Killers')
      within "##{@party_5.id}" do
        expect(page).to have_link('Up')
        expect(page).to have_content('Host: Bryan')
        expect(page).to have_content('Users Invited:')
        expect(page).to have_content('Mostafa')
        expect(page).to_not have_content('Yuji')
        expect(page).to have_content('Date: 12/08/2022')
        expect(page).to have_content('Time: 5:00 pm')
        expect(page).to have_css("img[src*='image.tmdb.org/t/p/original']")
      end
    end
  end
end
