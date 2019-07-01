class Alumno::AsistenciasController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_alumno
  before_action :set_presence, only: [:show, :edit, :update]

  # GET /alumno/notas
  # GET /alumno/notas.json
  def index
    @notas = current_user.asignaturas.all
    @user = current_user
    @presences = Presence.where(curso: params[:id]).text_search(params[:query])
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  # GET /alumno/notas/1
  # GET /alumno/notas/1.json
  def show
    @asignatura = params[:asignatura]
    @notas = current_user.notas.where(asignatura: @asignatura)
    @user = current_user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_presence
      @presence = Presence.find_by(params[:presence_id])
    end

    def presence_params
      params.fetch(:presence, {})
    end

    def authenticate_alumno
      unless current_user.has_role? :alumno
        flash[:alert] = "No tienes permisos necesarios para ver esta sección."
        redirect_to root_path
      end
    end
end
