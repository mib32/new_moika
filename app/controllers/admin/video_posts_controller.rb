class Admin::VideoPostsController < AdminController
  before_action :set_admin_video_post, only: [:show, :edit, :update, :destroy]

  # GET /admin/posts
  # GET /admin/posts.json
  def index
    @admin_video_posts = VideoPost.all
    @admin_video_post_categories = PostCategory.all
  end

  # GET /admin/posts/1
  # GET /admin/posts/1.json
  def show
  end

  # GET /admin/posts/new
  def new
    @admin_video_post = VideoPost.new
  end

  # GET /admin/posts/1/edit
  def edit
    @admin_video_post = VideoPost.find params[:id]
  end

  # POST /admin/posts
  # POST /admin/posts.json
  def create
    # params[:post][:type] = params[:type]

    @admin_video_post = VideoPost.new(admin_video_post_params)

    respond_to do |format|
      if @admin_video_post.save
        format.html { redirect_to admin_video_post_path(@admin_video_post), notice: 'Публикация успешно создана' }
        format.json { render action: 'show', status: :created, location: @admin_video_post }
      else
        format.html { render action: 'new' }
        format.json { render json: @admin_video_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/posts/1
  # PATCH/PUT /admin/posts/1.json
  def update
    respond_to do |format|
      if @admin_video_post.update(admin_video_post_params)
        format.html { redirect_to admin_video_post_path(@admin_video_post), notice: 'Публикация успешно обновлена' }
        format.json { render action: 'show', status: :ok, location: @admin_video_post }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin_video_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/posts/1
  # DELETE /admin/posts/1.json
  def destroy
    @admin_video_post.destroy
    respond_to do |format|
      format.html { redirect_to admin_video_posts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_video_post
      @admin_video_post = VideoPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_video_post_params
      params.require(:video_post).permit(:title, :subtitle, :content, :bootsy_image_gallery_id, :type, :post_category_id)
    end
end
