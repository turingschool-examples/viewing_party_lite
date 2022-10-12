# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Landing Page' do
  describe 'As a user when I visit the Landing Page' do
    it 'I see the header for the page' do
      visit root_path

      expect(page).to have_content('Viewing Party Light')
    end
  end
end
