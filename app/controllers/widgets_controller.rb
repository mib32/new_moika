class WidgetsController < ApplicationController
  before_action :set_car_wash
  def update
    
    x = 1

  end

  private

  def set_car_wash
    @car_wash = CarWash.find(params[:car_wash_id])
  end
end
