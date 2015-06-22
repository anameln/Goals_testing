# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime
#  updated_at      :datetime
#

require 'BCrypt'

class User < ActiveRecord::Base
  DAILY_CHEER_LIMIT = 5

  attr_reader :password
  validates :username, :password_digest, :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }
  after_initialize :ensure_session_token

  has_many :goals, class_name: "Goal", foreign_key: :author_id

  has_many :comments, as: :commentable

  has_many :authored_comments, class_name: "Comment", foreign_key: :author_id

  has_many :cheers

  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil if user.nil?

    user.is_password?(password) ? user : nil
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!

    self.session_token
  end

  def cheers_made_today
    self.cheers.where(created_at: Date.today).count
  end

  private

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

end
