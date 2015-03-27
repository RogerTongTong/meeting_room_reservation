class User < ActiveRecord::Base
  has_many :reservations, -> { where(date: Date.current).order('time asc') }
  before_save :downcase_email
  validates :name, presence: true, length: {maximum: 50}
  validates :email, presence: true, length: {maximum: 250}, uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: 6}
  has_secure_password

  private

  def downcase_email
    self.email = email.downcase
  end

end
