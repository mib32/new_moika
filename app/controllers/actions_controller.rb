class ActionsController < ApplicationController

# Action is Legacy Name for the proposals

  def index
    @proposals = Action.left
  end

end