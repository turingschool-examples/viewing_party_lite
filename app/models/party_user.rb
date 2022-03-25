class PartyUser < ApplicationRecord
  before_create :set_default_status
  belongs_to :user
  belongs_to :party

  enum status: {attending: 0, hosting: 1}

  def set_default_status
    self.status ||= :attending
  end
end
