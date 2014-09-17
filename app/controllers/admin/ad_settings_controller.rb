class Admin::AdSettingsController < AdminController
  before_action :_create_settings_if_none_also_set


  # @settings is set from before_action
  def index
  end

  def update
    @ad_settings.update settings_params
    respond_to do |format|
      format.html { render action: 'index' }
    end
  end

  private

  def _create_settings_if_none_also_set
    parent_name = Rails.application.class.parent_name
    s =  AdSettings.find_by_app_name parent_name
    if s.nil?
      s = AdSettings.create :app_name => parent_name
    end
    @ad_settings = s
  end

  def settings_params
      params.require(:ad_settings).permit(:ad_1_title, :ad_1_text, :ad_2_title, :ad_2_text)
  end
end