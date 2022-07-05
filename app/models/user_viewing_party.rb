class UserViewingParty < ApplicationRecord

  belongs_to :user
  belongs_to :viewing_party

  validates_presence_of :hosting

end