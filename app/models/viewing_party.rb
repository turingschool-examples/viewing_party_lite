class ViewingParty < ApplicationRecord
  validates_presence_of :movie_id, :host_id
  validates :duration, presence: true, numericality: true
  validates :eventdate, presence: true
  validates :starttime, presence: true

  belongs_to :host, class_name: 'User'

  has_many :user_viewing_parties
  has_many :users, through: :user_viewing_parties

  def attendees
    @attendees = User.where.not(id: host.id)
  end
end
