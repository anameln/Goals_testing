# == Schema Information
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  content    :string           not null
#  author_id  :integer          not null
#  private    :boolean          default(FALSE), not null
#  completed  :boolean          default(FALSE), not null
#  created_at :datetime
#  updated_at :datetime
#

class Goal < ActiveRecord::Base
  validates :author_id, :content, presence: true
  validates :private, :completed, inclusion: [true, false]

  belongs_to :author, class_name: "User", foreign_key: :author_id

  after_initialize :set_default

  private

  def set_default
    self.completed = FALSE
  end
end
