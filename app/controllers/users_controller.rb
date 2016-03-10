class UsersController < ApplicationController
  def show
    @univ = Univ.find(current_user.univ_id)
    @circles = Circle.where(user_id: current_user.id)
  end
end
