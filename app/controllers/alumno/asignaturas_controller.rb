class Alumno::AsignaturasController < ApplicationController
  before_action :set_asignatura, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :authenticate_alumno

  # GET /alumno/asignaturas
  # GET /alumno/asignaturas.json
  def index
    @asignaturas = Asignatura.all
  end

  # GET /alumno/asignaturas/1
  # GET /alumno/asignaturas/1.json
  def show
  end

  # GET /alumno/asignaturas/new
  def new
    @asignatura = Asignatura.new
  end

  # GET /alumno/asignaturas/1/edit
  def edit
  end

  # POST /alumno/asignaturas
  # POST /alumno/asignaturas.json
  def create
    @asignatura = Asignatura.new(asignatura_params)

    respond_to do |format|
      if @asignatura.save
        format.html { redirect_to @asignatura, notice: 'Asignatura was successfully created.' }
        format.json { render :show, status: :created, location: @asignatura }
      else
        format.html { render :new }
        format.json { render json: @asignatura.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alumno/asignaturas/1
  # PATCH/PUT /alumno/asignaturas/1.json
  def update
    respond_to do |format|
      if @asignatura.update(asignatura_params)
        format.html { redirect_to @asignatura, notice: 'Asignatura was successfully updated.' }
        format.json { render :show, status: :ok, location: @asignatura }
      else
        format.html { render :edit }
        format.json { render json: @asignatura.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alumno/asignaturas/1
  # DELETE /alumno/asignaturas/1.json
  def destroy
    @asignatura.destroy
    respond_to do |format|
      format.html { redirect_to alumno_asignaturas_url, notice: 'Asignatura was successfully destroyed.' }
      format.json { head :no_content }
    end
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
