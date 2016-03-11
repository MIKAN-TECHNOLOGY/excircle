class CirclesController < ApplicationController
  def show
    @circles = Circle.where(id: params[:id])
    @events = Event.where(circle_id: @circles)
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
