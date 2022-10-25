class ViewingParty < ApplicationRecord
  validates :movie_id, :host_id, :eventdate, :starttime, presence: true
  validates :duration, presence: true, numericality: true

  belongs_to :host, class_name: 'User'

  has_many :user_viewing_parties
  has_many :users, through: :user_viewing_parties

  def attendees
    self.users.select(:name).where.not(id: host.id).pluck(:name).to_sentence
  end
end
