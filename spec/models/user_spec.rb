require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :email}
    it {should validate_uniqueness_of :email}
    # it {should validate_format_of(:email).with(URI::MailTo::EMAIL_REGEXP)}
  end

  describe "relationships" do
    it {should have_many :view_parties}
  end

  before :each do
    load_test_data
  end
end