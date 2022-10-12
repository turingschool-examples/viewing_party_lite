require 'rails_helper'

RSpec.describe "Landing Page" do
    describe "As a user when I visit the Landing Page" do
        it 'I see the header for the page' do
            visit root_path
            
            expect(page).to have_content("Viewing Party Light")
        end

        describe 'Navigation Bar' do
            it 'should have a navigation bar' do
                visit root_path

                expect(page).to have_css('.topnav', text: 'Home', visible: true)
                expect(page).to have_css('.topnav', text: 'About', visible: true)
                expect(page).to have_css('.topnav', text: 'Viewing Party Light', visible: true)
            end

            it 'home button should navigate to landing page' do
                visit root_path

                # save_and_open_page
                click_link 'Home'
                expect(current_path).to eq root_path
            end

            it 'about button should navigate to about page' do
                visit root_path

                click_link 'About'

                expect(current_path).to eq about_path
            end

        end
    end
end