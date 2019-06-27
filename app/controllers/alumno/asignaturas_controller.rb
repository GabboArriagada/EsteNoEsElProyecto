class Alumno::AsignaturasController < ApplicationController
  before_action :set_asignatura, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :authenticate_alumno

  # GET /alumno/asignaturas
  # GET /alumno/asignaturas.json
  def index
    @asignaturas = current_user.asignaturas.all.order(created_at: :desc)
  end

  # GET /alumno/asignaturas/1
  # GET /alumno/asignaturas/1.json
  def show
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

    def authenticate_alumno
      unless current_user.has_role? :alumno
        flash[:alert] = "No tienes permisos necesarios para ver esta sección."
        redirect_to root_path
      end
    end
end
