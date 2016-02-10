class HomeController < ApplicationController

  before_action :authenticate_user!

  def index
    chores = current_user.chores
    @done = chores.select { |c| c.done? }
    @todo = chores.select { |c| !c.done? }
  end

end
