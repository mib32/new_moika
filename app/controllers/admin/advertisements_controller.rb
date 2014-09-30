class Admin::AdvertisementsController < AdminController


  def index
    @ads = Advertisement.where("type = ?", params[:type]).limit(10)
  end


  def update
    params[:ads].each do |ad|
      Advertisement.update(ad['id'], text: ad['text'], url: ad['url'])
    end
    redirect_to({action: :index}, notice: 'Успешно сохранено')
  end
end