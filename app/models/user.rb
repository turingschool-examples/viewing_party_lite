class User < ApplicationRecord
  has_many :event_users, dependent: :destroy
  has_many :movies, through: :event_users, dependent: :destroy

  def invited_events
    event_users.where(role: 1)
  end

  def created_events
    event_users.where(role: 0)
  end
end
