# frozen_string_literal: true

require 'rails_helper'

describe 'layouts/application' do
  context 'link to home page' do
    it 'should display a link to the home page in every page' do
      render
      expect(rendered).to have_link('Home Page')
    end
  end
end
