require 'rails_helper'

RSpec.describe 'user dashboard' do
  it 'has discover movies button' do
    user1 = User.create!(email: "user1@example.com", name: "Jeff Casimir")

    visit user_path(user1.id)
    click_button "Discover Movies"

    expect(current_path).to eq("/users/#{user1.id}/discover")
  end

  it ' has a title at the top of the page that includes the users name' do
    user1 = User.create!(email: "user1@example.com", name: "Jeff Casimir")

    visit user_path(user1.id)

    within('#header') do
      expect(page).to have_content("Jeff Casimir's Dashboard")
    end
  end

  it 'shows a list of viewing parties the user is invited to' do
    # must include: movie image,
    #               movie title(as link to movie show page),
    #               date and time of event,
    #               who is hosting the event,
    #               list of users invited
  end

  xit 'show a list of viewing parties the user has created' do
    # must include: movie image,
    #               movie title(as link to movie show page),
    #               Date and time of event,
    #               That I am the host of the party,
    #               List of friends invited to the viewing party
  end
end
