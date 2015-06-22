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
  validates :author_id, :content, :private, :completed, presence: true
end
