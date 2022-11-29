require 'rails_helper'

describe "layouts/application" do

  context "link to home page" do
    it "should display a link to the home page in every page" do
      render
      rendered.should have_link('/')
    end
  end
end