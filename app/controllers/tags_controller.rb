class TagsController < ApplicationController
  def show
    @circles = Circle.where(tag_id: params[:id])
  end
end
