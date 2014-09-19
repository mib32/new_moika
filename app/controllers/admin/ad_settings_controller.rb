class Admin::AdSettingsController < Admin::SettingsController
  before_action :_create_settings_if_none_also_set

  def index
    redirect_to edit_admin_ad_setting_path(@settings)
  end

  def update
    @settings.update ad_settings_params
    respond_to do |format|
      format.html { render action: 'edit' }
    end
  end

  def edit
  end

  private

  def _create_settings_if_none_also_set
    parent_name = Rails.application.class.parent_name
    s =  AdSettings.find_by_app_name parent_name
    if s.nil?
      s = AdSettings.create :app_name => parent_name
    end
    @settings = s
  end

  def ad_settings_params
      params.require(:ad_settings).permit(:ad_1_title, :ad_1_text, :ad_2_title, :ad_2_text)
  end
end