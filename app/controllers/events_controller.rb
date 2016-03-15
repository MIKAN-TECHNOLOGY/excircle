class EventsController < ApplicationController

  before_action :move_to_show, except: :show

  def show
    @events = Event.where(id: params[:id])
    @circle_events = Event.where(circle_id: params[:circle_id]).page(params[:page]).per(6)
    @tags=Tag.all
    @univs=Univ.all
  end

 def index
  end

  def new
    @circle = Circle.find(params[:circle_id])
    @event = Event.new
  end

  def create
    @event = Event.create(create_params)
    @time =@event.date
    Event.find(@event.id).update(date: @time)
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
    @time =@event.date
    Event.find(@event.id).update(date: @time)
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
