class UsersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end


  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
    redirect_to users_path, notice: "Usuario borrado exitosamente"
  end

end
