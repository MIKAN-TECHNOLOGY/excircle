class TopController < ApplicationController
  def index
    @circles = Circle.limit(6).order('id DESC')
    @events = Event.limit(6).order('id DESC')
    @users = User.all
    @univs = Univ.all
    @tags = Tag.all
  end
end
