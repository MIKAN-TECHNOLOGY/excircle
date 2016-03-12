class EventsController < ApplicationController

  before_action :move_to_show, except: :show

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    Event.create(update_params)
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    Event.find(params[:id]).update(update_params)
  end

  private
  def update_params
    params.require(:event).permit(:name,:date,:place,:cost,:content,:contact)
  end

  def move_to_show
    redirect_to action: :show unless user_signed_in?
  end
end
