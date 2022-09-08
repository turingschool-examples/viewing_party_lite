class User < ApplicationRecord
    #has_many :user_parties
    #has_many :parties, though: :user_parties
    validates :password_digest, presence: true
    validates_uniqueness_of :email, case_sensitive: false
    has_secure_password
    validates_presence_of :name
    validates :email, uniqueness: true, presence: true
    validates :role, presence: true

    before_save :downcase_email

    enum role: ['default', 'manager', 'admin']

    
  private

  def downcase_email
    email&.downcase!
  end

end