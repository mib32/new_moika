class Admin::PostCategoriesController < AdminController

  def new
    @category = PostCategory.new
  end
  
  def create
    @category = PostCategory.new(post_categories_params)

    if @category.save
      respond_to do |format|
        format.js
      end
    end
  end

  def edit
    @category = PostCategory.find params[:id]
  end

  def update
    @category = PostCategory.find params[:id]

    if @category.update post_categories_params
      redirect_to admin_video_posts_path
    end
  end

  def destroy
    @category = PostCategory.find params[:id]

    if @category.destroy
      redirect_to admin_video_posts_path
    end
  end



  private

  def post_categories_params
    params.require('post_category').permit(:name)
  end
end
