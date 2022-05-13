class PartyUser < ApplicationRecord
  belongs_to :user
  belongs_to :party

  validates :host, inclusion: { in: [true, false] }
end
