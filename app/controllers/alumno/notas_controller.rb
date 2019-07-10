class Alumno::NotasController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_alumno

  # GET /alumno/notas
  # GET /alumno/notas.json
  def index
    @notas = current_user.asignaturas.all
    @user = current_user
    if @user.es_apoderado?
      @notas = User.find(@user.alumno_id).asignaturas
    end
  end

  # GET /alumno/notas/1
  # GET /alumno/notas/1.json
  def show
    @asignatura = params[:asignatura]
    @notas = current_user.notas.where(asignatura: @asignatura)
    @user = current_user
    if @user.es_apoderado?
      @asignatura = params[:asignatura]
      @notas = User.find(@user.alumno_id).notas.where(asignatura: @asignatura)
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def nota_params
      params.fetch(:nota, {})
    end

    def authenticate_alumno
      unless (current_user.has_role?(:alumno) || current_user.es_apoderado?)
        flash[:alert] = "No tienes permisos necesarios para ver esta sección."
        redirect_to root_path
      end
    end
end
