# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @user = User.find_by(id: params[:id])
    gon.users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    @post = Post.new
    @post.photos.build
    @post.build_map
    @posts = @user.posts.limit(10).includes(:map, :photos, :user).order('created_at DESC')
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = 'ユーザーを削除しました。'
    redirect_to posts_path
  end
end
