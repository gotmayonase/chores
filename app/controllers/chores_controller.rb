class ChoresController < ApplicationController

  before_action :authenticate_user!

  def complete
    @chore = Chore.find(params[:id])
    if @chore.user = current_user
      ChoreCompletion.create(chore: @chore, user: current_user)
    end
    redirect_to '/'
  end

end
