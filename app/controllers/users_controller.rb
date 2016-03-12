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

  def destroy
    current_user.circles.events.destroy_all
    current_user.circles.destroy_all
    current_user.destroy
  end

  private
  def update_params
    params.require(:user).permit(:email, :password, :name, :univ_id, :avatar)
  end
end
