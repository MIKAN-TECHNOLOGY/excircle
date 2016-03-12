class CirclesController < ApplicationController

  before_action :move_to_show, only: :edit

  def show
    @circles = Circle.where(id: params[:id])
    @events = Event.where(circle_id: @circles)
    @user_id=Circle.where(id: params[:id]).select("user_id")
    @user=User.where(id: @user_id).select("name")
    @univ_id=User.where(id: @user_id).select("univ_id")
    @thisuniv=Univ.where(id: @univ_id)
    @univs = Univ.all
    @tags = Tag.all
  end

  def search
    @circles = Circle.where('name LIKE(?)', "%#{params[:search]}%")
    @univs = Univ.all
    @tags = Tag.all
  end

  def edit
    @circles = Circle.find(params[:id])
  end

  def update
    Circle.find(params[:id]).update(update_params)
  end

  private
  def update_params
    params.require(:circle).permit(:name)
  end

  def move_to_show
    redirect_to action: :show unless user_signed_in? && current_user.id == Circle.find(params[:id]).user_id
  end

end
