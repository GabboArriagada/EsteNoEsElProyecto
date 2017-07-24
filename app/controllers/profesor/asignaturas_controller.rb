class Profesor::AsignaturasController < ApplicationController
  before_action :set_asignatura, only: [:show, :edit, :update, :destroy, :notas]
  before_action :authenticate_user!
  before_action :authenticate_profesor

  def notas
    @user = params[:user]
    @asignatura = params[:asignatura]
    @notas = Nota.where(user: @user, asignatura: @asignatura)
  end

  # GET /profesor/asignaturas
  # GET /profesor/asignaturas.json
  def index
    @cursos = current_user.cursos.all
  end

  # GET /profesor/asignaturas/1
  # GET /profesor/asignaturas/1.json
  def show
    @alumnos = @asignatura.users.with_role :alumno
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asignatura
      @asignatura = Asignatura.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def asignatura_params
      params.fetch(:asignatura, {})
    end

    def authenticate_profesor
      unless current_user.has_role? :profesor
        flash[:alert] = "No tienes permisos necesarios para ver esta sección."
        redirect_to root_path
      end
    end
end
