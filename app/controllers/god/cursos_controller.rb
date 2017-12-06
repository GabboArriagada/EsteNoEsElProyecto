class God::CursosController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  def index
    @cursos = Curso.all
  end
  def show
    @curso = Curso.find(params[:id])
    @profesor_assigned = @curso.users.with_role:profesor
    @alumnos_assigned = @curso.users.with_role:alumnos
    @alumnos = User.with_role:alumno
    @profesores = User.with_role:profesor
  end

  def assign
    @cursos = Curso.all
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def authenticate_admin
      unless current_user.has_role? :admin
        flash[:error] = "No tienes permisos necesarios para ver esta sección."
        redirect_to root_path
      end
    end
end
