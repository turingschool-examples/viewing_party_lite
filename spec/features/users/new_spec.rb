require "rails_helper"


RSpec.describe("New Register Page") do
  before(:each) do
    visit(new_register_path)
  end

  describe("when i vist root_path theres a linke to create a new register") do
    describe("When I click on the link it takes me a to a form to create a new item") do
      it("the form has fields for name and email,when i click submit im redirected back to root_path where i see the new register") do
        expect(page).to(have_field("Name"))
        expect(page).to(have_field("Email"))
        fill_in("Name",         with: "Milo")
        fill_in("Email",         with: "MilosMurphyslaw@gmail.com")
        click_on("Create New User")
        expect(current_path).to(eq(root_path))
      end
    end
  end
end
