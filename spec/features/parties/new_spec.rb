require 'rails_helper'

RSpec.describe 'new party page' do
    let!(:user1) {User.create(name: 'person1', email: 'email1@email1.com')}
    let!(:user2) {User.create(name: 'person2', email: 'email1@email2.com')}
    let!(:user3) {User.create(name: 'person3', email: 'email1@email3.com')}
    let!(:user4) {User.create(name: 'person4', email: 'email1@email4.com')}
  before(:each) do
    details = JSON.parse(File.read('spec/fixtures/movie_details.json'), symbolize_names: true)
    allow(TmdbService).to receive(:movie_details).and_return(details)
    cast = JSON.parse(File.read('spec/fixtures/movie_cast.json'), symbolize_names: true)
    allow(TmdbService).to receive(:movie_cast).and_return(cast)
    review = JSON.parse(File.read('spec/fixtures/movie_review.json'), symbolize_names: true)
    allow(TmdbService).to receive(:movie_review).and_return(review)

    visit "users/#{user1.id}/movies/545611/viewing_party/new"
  end

  it 'can create new party' do

    within(".user-#{user2.id}") do 
      page.check
    end

    click_on 'Create'
    expect(current_path).to eq(user_path(user1))
    expect(page).to have_content("#{user1.name}'s Dashboard")
  end

  xit 'shows error message when unable to create party' do
    

    click_button('Create New User')

    expect(current_path).to eq('/register')
    expect(page).to have_content('Error: please enter a duration longer than 2 hr 30 mins.')
  end
end
