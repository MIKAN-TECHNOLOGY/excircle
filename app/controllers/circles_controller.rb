class CirclesController < ApplicationController
  def show
    @circles = Circle.where(id: params[:id])
    @events = Event.where(circle_id: @circles)
  end

  def search
    @circles = Circle.where('name LIKE(?)', "%#{params[:search]}%")
  end

  def edit
  end

end
