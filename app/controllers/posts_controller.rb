class PostsController < ApplicationController

  def index
    @posts = Post.where(type: params[:type])
  end

  def show
    @post = Post.find(params[:id])
  end

end
