class ViewingParty < ApplicationRecord
  validates_presence_of :movie_title
  validates_presence_of :movie_id
  validates_presence_of :host_id
  validates_presence_of :duration
  validates_numericality_of :duration
  validates_presence_of :date
  validates_presence_of :start_time
  validates_presence_of :poster_path

  belongs_to :host, class_name: 'User'
  has_many :user_viewing_parties
  has_many :users, through: :user_viewing_parties

  def attendees
    self.users.select(:name).where.not(id: host.id).pluck(:name).to_sentence
    # self.users.select(:name).where.not(id: host.id).pluck(:name)
  end
end
