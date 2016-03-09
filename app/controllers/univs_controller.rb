class UnivsController < ApplicationController
  def show
    @circle = Circle.where(user_id: User.where(univ_id: params[:id]).select("id"))
  end
end
