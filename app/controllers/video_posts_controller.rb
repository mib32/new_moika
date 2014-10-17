class VideoPostsController < ApplicationController

  def index
    @posts = VideoPost.all
  end

  def show
    @post = VideoPost.all
  end

end