class UserViewParty < ApplicationRecord
  belongs_to :user
  belongs_to :view_party

  validates :host, inclusion: { in: [true, false] }
end
