class User < ApplicationRecord
  validates_presence_of :name
  validates :email, presence: true, uniqueness: true

  def self.all_except(user)
    where.not(id: user)
  end

  def name_and_email
    "#{name} (#{email})"
  end

  def invited
    require 'pry'; binding.pry
  end
  
end
