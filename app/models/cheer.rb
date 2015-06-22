class Cheer < ActiveRecord::Base
  validates :goal_id, :user_id, presence: true
  validate :daily_cheer_limit

  belongs_to :user
  belongs_to :goal

  private

  def daily_cheer_limit
    user = User.find(self.user_id)
    unless user.cheers_made_today < User::DAILY_CHEER_LIMIT
      errors.add(:base, "#{user.username} is out of cheers.")
    end
  end

end
