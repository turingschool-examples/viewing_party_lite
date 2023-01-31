# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Landing page', type: :feature do
  describe 'when a user' do
    describe 'visits the root path, it' do
      it 'should display the app name' do
        visit '/'

        expect(page).to have_content('Viewing Party Lite')
      end

      it 'has a button to create a new user' do
        visit '/'

        expect(page).to have_button('Create a New User')

        click_button 'Create a New User'

        expect(current_path).to eq new_user_path
      end

      it 'has a list of existing users with links to their dashboards' do
        u1 = create(:user)
        u2 = create(:user)
        u3 = create(:user)
        u4 = create(:user)
        u5 = create(:user)

        visit '/'

        expect(page).to have_content('Existing Users')

        within "#user-#{u1.id}" do
          expect(page).to have_link(u1.name, href: user_path(u1))
        end

        within "#user-#{u2.id}" do
          expect(page).to have_link(u2.name, href: user_path(u2))
        end

        within "#user-#{u3.id}" do
          expect(page).to have_link(u3.name, href: user_path(u3))
        end

        within "#user-#{u4.id}" do
          expect(page).to have_link(u4.name, href: user_path(u4))
        end

        within "#user-#{u5.id}" do
          expect(page).to have_link(u5.name, href: user_path(u5))
        end
      end

      it 'has a link to return to the landing page' do
        visit '/'

        expect(page).to have_link('Landing Page', href: '/')
      end
    end
  end
end
