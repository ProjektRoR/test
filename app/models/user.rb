class User < ActiveRecord::Base
  attr_accessible :account_type, :favourite, :mail, :name, :password, :surname, :password_digest,
                  :password_confirmation #modified by pk 20.04.2015

  validates :name, presence: true, length: { maximum: 25 }
  validates :surname, presence: true, length: { maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :mail, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  #has_secure_password
  validates :password, length: { minimum: 4 }

  validates_confirmation_of :password     #modified by pk 20.04.2015
  validates_presence_of :password_confirmation, if: :password_changed?
    #message: 'should match confirmation'
end