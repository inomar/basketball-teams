class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by!(uuid: params[:uuid])
  rescue => e
    redirect_to root_path, notice: 'ユーザーが存在しません。'
  end
end
