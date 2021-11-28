class PagesController < ApplicationController
  def about; end

  def terms; end

  def top
    @post = Post.new
    @post.photos.build
    @post.build_map
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).limit(10).includes(:map, :photos, :user).order('created_at DESC')
  end
end
