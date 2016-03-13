class CirclesController < ApplicationController

  before_action :move_to_show, only: [:edit, :destoy]
  before_action :move_for_new, only: :new

  def show
    @circles = Circle.where(id: params[:id])
    @events = Event.where(circle_id: @circles)
    @user_id = Circle.where(id: params[:id]).select("user_id")
    @user = User.where(id: @user_id).select("name")
    @univ_id = User.where(id: @user_id).select("univ_id")
    @thisuniv = Univ.where(id: @univ_id)
    @univs = Univ.all
    @tags = Tag.all
  end

  def search
    @circles = Circle.where('name LIKE(?)', "%#{params[:search]}%")

    @univs = Univ.all
    @tags = Tag.all
  end

  def new
    @circles = Circle.new
  end

  def create
    @circles = Circle.create(create_params)
    Circle.find(@circles.id).update(user_id: current_user.id)
      if @circles.save
  else
    # ValidationエラーなどでDBに保存できない場合 new.html.erb を再表示
    render 'new'
  end
  end

  def edit
    @circles = Circle.find(params[:id])
  end

  def update
    Circle.find(params[:id]).update(update_params)
    
  if @circles.save
  else
    # ValidationエラーなどでDBに保存できない場合 edit.html.erb を再表示
    render 'edit'
  end
  end

  def destroy
    Circle.find(params[:id]).events.destroy_all
    Circle.find(params[:id]).destroy
  end

  private
  def create_params
    params.require(:circle).permit(:name,:n_member,:appeal,:detail,:campus,:official,:intercollege,:tag_id,:avatar)
  end

  def update_params
    params.require(:circle).permit(:name,:n_member,:appeal,:detail,:campus,:official,:intercollege,:tag_id,:avatar)
  end

  def move_to_show
    redirect_to action: :show unless user_signed_in? && current_user.id == Circle.find(params[:id]).user_id
  end

  def move_for_new
    redirect_to controller: :top, action: :index unless user_signed_in?
  end
end
