require 'rails_helper'

RSpec.describe 'User Dashboard' do
  it 'when I visit (/users/:id), I should see <user_name>s Dashboard at top of page' do
    user1 = User.create!(name: 'Kevin', email: 'kta@turing.edu')
    user2 = User.create!(name: 'Bryan', email: 'bkeener@turing.edu')
    visit user_path(user1)

    expect(page).to have_content("Kevin's Dashboard")
    expect(page).to_not have_content(user1.email)
    expect(page).to have_link('Home')
    expect(page).to_not have_content("Bryan's Dashboard")
    expect(page).to_not have_content(user2.email)
  end

  it 'has a button that will take you to a movies discover page' do
    user1 = User.create!(name: 'Kevin', email: 'kta@turing.edu')

    visit user_path(user1)

    expect(page).to have_button('Discover Movies')
    click_button('Discover Movies')

    expect(current_path).to eq(user_discovers_path(user1))
  end

  it 'has a section that lists viewing parties' do
    user1 = User.create!(name: 'Kevin', email: 'kta@turing.edu')

    visit user_path(user1)

    expect(page).to have_content('Current Viewing Parties')
  end

  describe 'viewing parties details that a user is invited to' do        #USER STORY 7 DASHBOARD VIEWING PARTIES
     before each: do 
      @user1 = User.create!(name: 'Kevin', email: 'kta@turing.edu')

      visit user_path(@user1)
     end
    xit 'displays movie image' do 
      #requires api call for movie image.
      #within block necessary? (will need to differentiate between viewing party as host / guest. see wireframe)
      expect(page).to have_content("Movie image pulled from api") 
    end
    xit 'displays Movie title, which links to the movie show page' do 
      #requires api call for movie title 
      expect(page).to have_content(<movie title here>)
      expect(page).to have_link("<movie_title here>")
      click_link("<movie_title here>")
      expect(current_path).to eq(<movie_show_page>)
    end
    xit 'displays date and time of event underneath title of movie of viewing party' do 
      #within block for specific invitation
      expect(page).to have_content(<date_of_event>) #format November 30, 2022 
      expect(page).to have_content(<time_of_event>) #format 7:00 pm
    end

    xit 'displays who is hosting event' do 

      #within block for specific viewing party
      expect(page).to have_content(<host_name>)
    end

    xit 'has a list of users invited with my name in bold' do 
      
      #will need within block to target viewing party.
      expect(page).to have_content(user1.name ) #name must be bold? not sure how to test for that
      expect(page).to have_content(<name_1>) 
      expect(page).to have_content(<name_2>)
      expect(page).to_not have_content(<name that is not included/ invited >)
    end
  end

  describe 'viewing parties where the user is the host' do 
    before :each do 
      @user1 = User.create!(name: 'Kevin', email: 'kta@turing.edu')

      visit user_path(@user1)
    end

     xit 'displays Movie title, which links to the movie show page' do 
      #requires api call for movie title 
      expect(page).to have_content(<movie title here>)
      expect(page).to have_link("<movie_title here>")
      click_link("<movie_title here>")
      expect(current_path).to eq(<movie_show_page>)
    end
    xit 'displays date and time of event underneath title of movie of viewing party' do 
      #within block for specific invitation
      expect(page).to have_content(<date_of_event>) #format November 30, 2022 
      expect(page).to have_content(<time_of_event>) #format 7:00 pm
    end

    xit 'displays user is hosting  viewing party' do 

      #within block for specific viewing party
      expect(page).to have_content("Hosting")
    end

    xit 'displays list of friends invited to the viewing party' do 

      #within block for "hosting"
      expect(page).to have_content(<name_1)>
      expect(page).to have_content(<name_2)>
      expect(page).to_not have_content(<name_3)>
      
    end
  end
end
