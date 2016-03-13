class EventsController < ApplicationController

  before_action :move_to_show, except: :show

  def show
    @event = Event.find(params[:circle_id])
  end

  def new
    @circle = Circle.find(params[:circle_id])
    @event = Event.new
  end

  def create
    @event = Event.create(create_params)
    Event.find(@event.id).update(circle_id: params[:circle_id])
  if @event.save
  else
    # ValidationエラーなどでDBに保存できない場合 new.html.erb を再表示
    render 'new'
  end
  end

  def edit
    @circle = Circle.find(params[:circle_id])
    @event = Event.find(params[:id])
  end

  def update
   @event= Event.find(params[:id]).update(update_params)
  if @event.save
  else
    # ValidationエラーなどでDBに保存できない場合 edit.html.erb を再表示
    render 'edit'
  end
  end

  def destroy
    Event.find(params[:id]).destroy
  end

  private
  def create_params
    params.require(:event).permit(:name,:date,:place,:cost,:content,:contact,:circle_id,:avatar)
  end

  def update_params
    params.require(:event).permit(:name,:date,:place,:cost,:content,:contact,:circle_id,:avatar)
  end

  def move_to_show
    redirect_to action: :show unless user_signed_in?
  end
end
