class Party < ApplicationRecord
  validates_presence_of :date, :time, :duration, :movie_id, :host

  has_many :party_users, dependent: :destroy
  has_many :users, through: :party_users

  # def duration_vs_runtime(runtime)
  #   if duration.present? && duration < runtime
  #     errors.add(:duration, "can not be shorter than movie length")
  #   end
  # end

  def movie
    MovieFacade.find_movie(movie_id)
  end

  def host_name
    User.find(host).name
  end
end
