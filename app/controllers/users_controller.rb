class UsersController < ApplicationController

  before_action :authenticate_user!

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
    @circles = current_user.circles
      @circles.each do |circle|
        circle.events.destroy_all
        circle.destroy
      end
    current_user.destroy
  end

  private
  def update_params
    params.require(:user).permit(:email, :password, :name, :univ_id, :avatar)
  end
end
