class UnivsController < ApplicationController
  def show
    @users = User.where(univ_id: params[:id]).select("id")

    @circles = Circle.where(user_id: @users)
  end
end