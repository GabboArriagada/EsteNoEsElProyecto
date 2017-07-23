class Profesor::CursosController < ApplicationController
  before_action :set_curso, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :authenticate_profesor

  # GET /profesor/cursos
  # GET /profesor/cursos.json
  def index
    @cursos = Curso.all
  end

  # GET /profesor/cursos/1
  # GET /profesor/cursos/1.json
  def show
    @asignaturas = @curso.asignaturas
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_curso
      @curso = Curso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def curso_params
      params.fetch(:curso, {})
    end

    def authenticate_profesor
      unless current_user.has_role? :profesor
        flash[:alert] = "No tienes permisos necesarios para ver esta sección."
        redirect_to root_path
      end
    end
end
