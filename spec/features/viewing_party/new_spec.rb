require 'rails_helper'

RSpec.describe 'viewing party new page' do
  before(:each) do
    @user1 = User.create!(name: 'Cory', email: 'cory@gmail.com')
  end

  it "gives details about the viewing party" do
    visit "/users/#{@user1.id}/movies/278/viewing-party/new"

    expect(page).to have_field('Duration of Party', with: '142 mins')
    expect(page).to have_field('When:')
    expect(page).to have_field('Start Time:')
    

  end
end
