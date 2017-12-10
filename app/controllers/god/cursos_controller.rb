class God::CursosController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  def index
    @cursos = Curso.all
  end
  def show
    @curso = Curso.find(params[:id])
    @profesor_assigned = @curso.users.with_role:profesor
    @alumnos_assigned = @curso.users.with_role:alumno
    @alumnos = User.with_role:alumno
    @profesores = User.with_role:profesor
  end

  def assign
    @cursos = Curso.all
  end

  def new
    @curso = Curso.new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def create
  end

  def asignar
    @curso = Curso.find(params[:curso])
    @user = User.find(params[:user])
    if @curso.users.exists?(:id => @user.id)
      redirect_to action: "show", id: @curso.id
    else
      @curso.users << @user
      redirect_to action: "show", id: @curso.id
    end
  end

  def desasignar
    @curso = Curso.find(params[:curso])
    @user = User.find(params[:user])
    @curso.users.delete(@user)
    if @curso.users.exists?(:id => @user.id)

      redirect_to action: "show", id: @curso.id
    else
      redirect_to action: "show", id: @curso.id
    end
  end

  private
    def authenticate_admin
      unless current_user.has_role? :admin
        flash[:error] = "No tienes permisos necesarios para ver esta sección."
        redirect_to root_path
      end
    end
end
