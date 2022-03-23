require 'rails_helper'

RSpec.describe 'landing page' do
  before(:each) do
    visit '/'
  end
  describe 'when user visits landing page' do
    scenario 'visitor sees title of application' do
      expect(page).to have_content('Viewing Party')
    end

    scenario 'visitor sees link to landing page' do
      click_link('Landing Page')
      expect(current_path).to eq('/')
    end
  end
end