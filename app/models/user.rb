class User < ActiveRecord::Base
  has_many :reservations, -> { where(date: Date.current).order('time asc') }
  # Todo: Change the block to callback
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: {maximum: 50}
  validates :email, presence: true, length: {maximum: 250}, uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: 6}
  has_secure_password

end
