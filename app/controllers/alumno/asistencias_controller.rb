class Alumno::AsistenciasController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_alumno
  before_action :set_presence, only: [:show, :edit, :update]

  # GET /alumno/notas
  # GET /alumno/notas.json
  def index
    @user = current_user
    @presences = Presence.where(user_id: current_user.id)
    @asistencias = @presences.group_by(&:fecha)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
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
