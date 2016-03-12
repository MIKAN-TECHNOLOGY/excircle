class UsersController < ApplicationController
  def show
    @circles = Circle.where(user_id: current_user.id)
    @events = Event.where(circle_id: @circles)
  end

  def edit
     @circles =Circle.find(:id)
  end

  def update
    current_user.update(update_params)
  end

  private
  def update_params
    params.require(:user).permit(:avatar)
  end
end
