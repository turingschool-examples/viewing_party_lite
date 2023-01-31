class User < ApplicationRecord

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  # validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
end