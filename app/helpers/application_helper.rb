module ApplicationHelper
  def display_status(goal)
    goal.completed? ? "completed" : "not yet completed" 
  end
end
