class Admin::PostsController < AdminController
  before_action :set_admin_post, only: [:show, :edit, :update, :destroy]

  # GET /admin/posts
  # GET /admin/posts.json
  def index
    @admin_posts = Post.where("type <> 'VideoPost'")
  end

  # GET /admin/posts/1
  # GET /admin/posts/1.json
  def show
  end

  # GET /admin/posts/new
  def new
    @admin_post = params[:type].constantize.new
  end

  # GET /admin/posts/1/edit
  def edit
    @admin_post = Post.find params[:id]
  end

  # POST /admin/posts
  # POST /admin/posts.json
  def create
    # params[:post][:type] = params[:type]

    @admin_post = params[:type].constantize.new(super_strong_params)

    respond_to do |format|
      if @admin_post.save
        format.html { redirect_to admin_post_path(@admin_post), notice: 'Публикация успешно создана' }
        format.json { render action: 'show', status: :created, location: @admin_post }
      else
        format.html { render action: 'new' }
        format.json { render json: @admin_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/posts/1
  # PATCH/PUT /admin/posts/1.json
  def update
    respond_to do |format|
      if @admin_post.update(super_strong_params)
        format.html { redirect_to admin_post_path(@admin_post), notice: 'Публикация успешно обновлена' }
        format.json { render action: 'show', status: :ok, location: @admin_post }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/posts/1
  # DELETE /admin/posts/1.json
  def destroy
    @admin_post.destroy
    respond_to do |format|
      format.html { redirect_to admin_posts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_post
      @admin_post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_news_post_params
      params.require(:news_post).permit(:title, :subtitle, :content, :bootsy_image_gallery_id, :type)
    end

    def admin_info_post_params
      params.require(:info_post).permit(:title, :subtitle, :content, :bootsy_image_gallery_id, :type)
    end

    def super_strong_params 
      send("admin_#{params[:type].underscore}_params")
    end
end
