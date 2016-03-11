class CirclesController < ApplicationController
  def show
    @circles = Circle.where(id: params[:id])
    @events = Event.where(circle_id: @circles)
    @user_id=Circle.where(id: params[:id]).select("user_id")
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
  end

end
