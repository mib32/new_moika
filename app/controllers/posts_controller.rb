class PostsController < ApplicationController

  def index
    @posts = Post.where(type: params[:type])
  end

end
