class CirclesController < ApplicationController
  def show
  end

  def search
    @circles = Circle.where('name LIKE(?)', "%#{params[:search]}%")
  end
end
