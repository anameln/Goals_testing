class CheersController < ApplicationController
  def create
    @cheer = current_user.cheers.new(cheer_params)
    if @cheer.save
      redirect_to user_url(@cheer.goal.author)
    else
      flash[:errors] = @cheer.errors.full_messages
      redirect_to user_url(@cheer.goal.author)
    end
  end

  private

  def cheer_params
    params.require(:cheer).permit(:goal_id)
  end

end
