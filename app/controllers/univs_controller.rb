class UnivsController < ApplicationController
  def show
<<<<<<< HEAD
=======
    @circle = Circle.where(user_id: User.where(univ_id: params[:id]).select("id"))
  end

  private
  def create_params

>>>>>>> e066f283767b7d173ed0c46b19546b30cb5a2dcb
  end
end
