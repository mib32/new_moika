class Admin::BannersConfigController < ApplicationController
  before_action :set_banners_config, only: [:update]

  def update
    respond_with @banners_config do |format|
      if @banners_config.update(banners_config_params)
        format.js
      else
        format.json { render json: @banner.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_banners_config
      @banners_config = BannersConfig.find(params[:id])
    end

    def banner_params
      params.require(:banners_config).permit(:place, :banner_id)
    end
end
