class User < ApplicationRecord
  validates_presence_of :name
  validates :email, presence: true, uniqueness: true

end
