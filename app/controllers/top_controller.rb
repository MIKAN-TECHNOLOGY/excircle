class TopController < ApplicationController
  def index
    @univs = Univ.all
    @tags = Tag.all
  end
end
