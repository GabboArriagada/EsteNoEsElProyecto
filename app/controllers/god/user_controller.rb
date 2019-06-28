class God::UserController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  def index
    @users = User.all.order(created_at: :desc)
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def edit
  end

  def update
  end

  def toprofesor
    @user = User.find(params[:user])
    @user.add_role(:profesor)
    redirect_to action: "index"
  end

  def toalumno
    @user = User.find(params[:user])
    @user.add_role(:alumno)
    redirect_to action: "index"
  end

  def toadmin
    @user = User.find(params[:user])
    @user.add_role(:admin)
    redirect_to action: "index"
  end

  def removeprofesor
    @user = User.find(params[:user])
    @user.remove_role :profesor
    redirect_to action: "index"
  end

  def removealumno
    @user = User.find(params[:user])
    @user.remove_role :alumno
    redirect_to action: "index"
  end

  def removeadmin
    @user = User.find(params[:user])
    @user.remove_role :admin
    redirect_to action: "index"
  end

  def destroy
    @user = User.find_by_id(params[:id])
    @user.destroy
    redirect_to "/god/user"
  end

  private

    def authenticate_admin
      unless current_user.has_role? :admin
        flash[:error] = "No tienes permisos necesarios para ver esta sección."
        redirect_to root_path
      end
    end
end
