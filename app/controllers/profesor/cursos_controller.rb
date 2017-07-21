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
  end

  # GET /profesor/cursos/new
  def new
    @curso = Curso.new
  end

  # GET /profesor/cursos/1/edit
  def edit
  end

  # POST /profesor/cursos
  # POST /profesor/cursos.json
  def create
    @curso = Curso.new(curso_params)

    respond_to do |format|
      if @curso.save
        format.html { redirect_to @curso, notice: 'Curso was successfully created.' }
        format.json { render :show, status: :created, location: @curso }
      else
        format.html { render :new }
        format.json { render json: @curso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profesor/cursos/1
  # PATCH/PUT /profesor/cursos/1.json
  def update
    respond_to do |format|
      if @curso.update(curso_params)
        format.html { redirect_to @curso, notice: 'Curso was successfully updated.' }
        format.json { render :show, status: :ok, location: @curso }
      else
        format.html { render :edit }
        format.json { render json: @curso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profesor/cursos/1
  # DELETE /profesor/cursos/1.json
  def destroy
    @curso.destroy
    respond_to do |format|
      format.html { redirect_to profesor_cursos_url, notice: 'Curso was successfully destroyed.' }
      format.json { head :no_content }
    end
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
