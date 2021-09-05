# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @user = User.find_by(id: params[:id])
    gon.users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end
end
