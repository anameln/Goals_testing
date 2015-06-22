class GoalsController < ApplicationController

  def new
    @goal = Goal.new
  end

  def create
    @goal = current_user.goals.new(goal_params)
    @goal.save
    flash[:errors] = @goal.errors.full_messages
    redirect_to user_url(current_user)
  end

  def complete
    @goal = current_user.goals.find(params[:id])
    @goal.update!(completed: true)
    flash[:errors] = @goal.errors.full_messages
    redirect_to user_url(current_user)
  end

  private

  def goal_params
    params.require(:goal).permit(:content, :private)
  end
end
