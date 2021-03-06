class UnivsController < ApplicationController
  def show
    @users = User.where(univ_id: params[:id]).select("id")
    @circles = Circle.where(user_id: @users).page(params[:page]).per(12)
    @univ_id = Univ.where(id: params[:id])
    @univs = Univ.all
    @tags = Tag.all
  end
end