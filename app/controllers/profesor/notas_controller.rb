class Profesor::NotasController < ApplicationController
  before_action :set_nota, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :authenticate_profesor

  # GET /profesor/notas
  # GET /profesor/notas.json
  def index
    @notas = Nota.all
  end

  # GET /profesor/notas/1
  # GET /profesor/notas/1.json
  def show
  end

  # GET /profesor/notas/new
  def new
    @nota = Nota.new
  end

  # GET /profesor/notas/1/edit
  def edit
  end

  # POST /profesor/notas
  # POST /profesor/notas.json
  def create
    @nota = Nota.new(nota_params)

    respond_to do |format|
      if @nota.save
        format.html { redirect_to @nota, notice: 'Nota was successfully created.' }
        format.json { render :show, status: :created, location: @nota }
      else
        format.html { render :new }
        format.json { render json: @nota.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profesor/notas/1
  # PATCH/PUT /profesor/notas/1.json
  def update
    respond_to do |format|
      if @nota.update(nota_params)
        format.html { redirect_to @nota, notice: 'Nota was successfully updated.' }
        format.json { render :show, status: :ok, location: @nota }
      else
        format.html { render :edit }
        format.json { render json: @nota.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profesor/notas/1
  # DELETE /profesor/notas/1.json
  def destroy
    @nota.destroy
    respond_to do |format|
      format.html { redirect_to profesor_notas_url, notice: 'Nota was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nota
      @nota = Nota.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nota_params
      params.fetch(:nota, {})
    end

    def authenticate_profesor
      unless current_user.has_role? :profesor
        flash[:alert] = "No tienes permisos necesarios para ver esta sección."
        redirect_to root_path
      end
    end
end
