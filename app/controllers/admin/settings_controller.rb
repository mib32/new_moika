class Admin::SettingsController < AdminController
  before_action :_create_settings_if_none_also_set
  def update
    @settings.update settings_params
    respond_to do |format|
      format.html { render action: 'edit' }
    end
  end
  private

  

   def settings_params
      # params.require(:settings).permit(:mq_message,:ad_1_title, :ad_1_text, :ad_2_title, :ad_2_text)
      params.require(:settings).permit!
    end
end