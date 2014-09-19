class Admin::MqSettingsController < Admin::SettingsController
  before_action :_create_settings_if_none_also_set


  # @settings is set from before_action
  def index
    redirect_to edit_admin_mq_setting_path(@settings)
  end

  # def update
  #   @settings.update mq_settings_params
  #   respond_to do |format|
  #     format.html { render action: 'index' }
  #   end
  # end

  def edit
  end

  private

  def _create_settings_if_none_also_set
    parent_name = Rails.application.class.parent_name
    s =  MqSettings.find_by_app_name parent_name
    if s.nil?
      s = MqSettings.create :app_name => parent_name
    end
    @settings = s
  end

  def settings_params
      params.require(:mq_settings).permit!
  end
end