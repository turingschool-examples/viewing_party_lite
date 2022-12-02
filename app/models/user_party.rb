class UserParty < ApplicationRecord
  enum user_status: [:host, :invited, :accepted, :declined]

  validates_presence_of :user_status, inclusion: [:host, :invited, :accepted, :declined]
  
  belongs_to :user
  belongs_to :party
end