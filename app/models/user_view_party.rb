class UserViewParty < ApplicationRecord
  belongs_to :user
  belongs_to :view_party

  validates_presence_of :host
end
