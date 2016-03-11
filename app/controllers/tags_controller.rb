class TagsController < ApplicationController
  def show
    @circles = Circle.where(tag_id: params[:id])
    @tag_id = Tag.where(id: params[:id])
    @univs = Univ.all
    @tags = Tag.all
  end
end
