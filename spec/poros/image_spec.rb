require 'rails_helper'

RSpec.describe Image do
  it "exists and has attributes" do
    data = {
            id: 278,
            posters: [{file_path: "/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg"}]
          }

    image = Image.new(data)

    expect(image).to be_a Image
    expect(image.id).to eq 278
    expect(image.file_path).to eq "/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg"
  end
end
