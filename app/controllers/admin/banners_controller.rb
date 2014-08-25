class Admin::BannersController < AdminController
  before_action :set_banner, only: [:show, :edit, :update, :destroy, :delete_file]
  skip_before_filter :verify_authenticity_token, :only => [:update]

  def index
    @ivideon_url2 = "http://open.ivideon.com/embed/v2/?server=200-ef82357d701571c3bce35f1014bf7ac6&camera=0&width=&height=&lang=ru"
    @car_wash2 = CarWash.where(video_url1: @ivideon_url2).first
    @banners = AdminBanner.all
    @image_banners = AdminImageBanner.all
    @youtube_banners = AdminYoutubeBanner.all
    @ivideon_banners = AdminIvideonBanner.all
    @slideshow_banners = AdminSlideshowBanner.all
    @top_text_banner = TextBanner.where(place: 'top').first
  end

  def show
  end

  def new
    @banner = AdminBanner.new
  end

  def edit
  end

  def create
    @banner = AdminBanner.new(banner_params)
    @banner.file = banner_params[:file]
    @banner.save!
      #render :nothing => true
      redirect_to admin_banners_path
  end

  def update
    respond_to do |format|
      logger.debug { "vatagin #{banner_params}" }
      if @banner.update(banner_params)
        bc = BannersConfig.where(place: @banner.place).first
        bc.banner = @banner
        bc.save!
        
        #format.html { redirect_to [:admin, @banner], notice: 'Banner was successfully updated.' }
        format.json
        format.js {}
      else
        format.json { render json: @banner.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @banner.destroy
    respond_to do |format|
      format.html { redirect_to admin_banners_url }
      format.json { head :no_content }
    end
  end

  def delete_file
    @banner.remove_file!
    @banner.save!
    respond_to do |format|
      format.json { render json: @banner.to_json(only: [:id, :file]) }
    end
  end

  private
    def set_banner
      @banner = AdminBanner.find(params[:id])
    end

    def banner_params
      params[:banner] ||= {}
      params[:banner][:file] = params[:file]
      params[:banner][:filename] = params[:name]
      params[:banner][:text] = params[:text]
      unless params[:admin_youtube_banner].blank?
        youtube_url  = params[:admin_youtube_banner][:youtube_url]
        unless youtube_url.blank?
          youtube_id = youtube_url.split('?v=')[1]
          unless youtube_id.blank?
            youtube_url = "//www.youtube.com/embed/" + youtube_id
            params[:banner][:youtube_url] ||= youtube_url
          end
        end
      end
      params.require(:banner).permit(:car_wash_id, :file, :filename, :text, :place, :type, :youtube_url)
    end

end
