class UsersController < ApplicationController
  def show
    @circles = Circle.where(user_id: current_user.id)
  end
end
