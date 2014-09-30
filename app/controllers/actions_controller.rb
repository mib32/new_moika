class ActionsController < ApplicationController

# Action is Legacy Name for the proposals

  def index
    @proposals = CarWash.where('widget_content is not null and updated_widget_at is not null').order('updated_widget_at desc')
  end

end