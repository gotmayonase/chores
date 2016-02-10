class ChoresController < ApplicationController

  before_action :authenticate_user!

  def complete
    @chore = Chore.find(params[:id])
    if @chore.user = current_user
      @chore.last_completed = Time.now
      @chore.save
    end
    redirect_to '/'
  end

end
