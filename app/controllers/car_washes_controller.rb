class CarWashesController < ApplicationController
  before_action :set_car_wash, only: [:show, :edit, :update, :destroy]
  before_filter :check_access, :only => [:new, :edit, :update, :destroy]

  # GET /car_washes
  # GET /car_washes.json
  def index
    case request.format
    when 'html'
      @car_washes  = CarWash.all.page(params[:page]).per 15
    when 'json'
      # byebug
      @car_washes = CarWash.preload(:categories).preload(:services).all
    end
    
  end

  def update_map
    @car_washes = CarWash.where('updated_at > ?', params[:updated_at])
    @updated_at = Time.now.utc
  end

  # GET /car_washes/1
  # GET /car_washes/1.json
  def show
    if @car_wash.nil?
      redirect_to :index
    end
    @unread_requests_count = @car_wash.requests.unread.count
    @images = @car_wash.images
    @videos = @car_wash.videos
  end

  def new
    @car_wash = CarWash.new
  end

  # GET /car_washes/1/edit
  def edit
    @full = (params['full'] == '1')
    @payment = Payment.new(car_wash_id: @car_wash.id, amount: 6000.00)
    @video = Video.new
    @image = Image.new

    @car_wash_services = []
    Service.all.each do |service|
      @car_wash_services << @car_wash.car_washes_services.find_or_create_by(service_id: service.id)
    end

  end

  # POST /car_washes
  # POST /car_washes.json
  def create
    @car_wash = CarWash.new(car_wash_params)

    respond_to do |format|
      if @car_wash.save
        format.html { redirect_to @car_wash, notice: 'Автомойка успешно создана' }
        format.json { render action: 'show', status: :created, location: @car_wash }
      else
        format.html { render action: 'new' }
        format.json { render json: @car_wash.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /car_washes/1
  # PATCH/PUT /car_washes/1.json
  def update
    @video = Video.new
    @image = Image.new
    
    update_params = car_wash_params
    unless car_wash_params[:widget_content].nil?
      update_params[:updated_widget_at] = Time.now
    end

    respond_to do |format|
      if @car_wash.update(update_params)
        # expire_fragment('car_washes_json')
        Rails.cache.delete 'car_washes_json'
        format.html { redirect_to edit_car_wash_path(@car_wash), notice: 'Автомойка успешно обновлена.' }
        format.json { head :no_content }
        format.js {
        }
      else
        format.html { render action: 'edit' }
        format.json { render json: @car_wash.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /car_washes/1
  # DELETE /car_washes/1.json
  def destroy
    @car_wash.destroy
    respond_to do |format|
      format.html { redirect_to car_washes_url }
      format.json { head :no_content }
    end
  end

  def subscribe
    @subscribe = Subscribe.new(normal_user_id: params[:user_id], car_wash_id: params[:id])

    respond_to do |format|
      if @subscribe.save
        format.html { render text: "Вы подписаны"}
        format.json { render json: @subscribe}
        format.js {}
      else
        format.json { render json: @subscribe.errors, status: :unprocessable_entity }
        format.js { alert("Ошибка") }
      end
    end
  end



  private
    def set_car_wash
      @car_wash = CarWash.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def car_wash_params
      params.require(:car_wash).permit(
        :title,
        :address,
        :lat,
        :lon,
        :contacts,
        :services,
        :price,
        :zones_count,
        :video_url1,
        :video_url2,
        :signal,
        :site_url,
        :updated_at,
        :grey,
        :signal_type,
        :video_title1,
        :video_title2,
        :widget_type,
        :widget_content,
        :title_video_url,
        :car_washes_services_attributes => [:price, :id],
        :category_ids => [],
        :service_ids => []
        )
    end
end
