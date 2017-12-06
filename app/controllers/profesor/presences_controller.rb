class Profesor::PresencesController < ApplicationController
  before_action :set_presence, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :authenticate_profesor

  # GET /presences
  # GET /presences.json
  def index
    @cursos = current_user.cursos.all
  end

  # GET /presences/1
  # GET /presences/1.json
  def show
    @users = current_user.cursos.find(params[:id]).users.all.with_role(:alumno)
    @cursos = current_user.cursos.all
    @presences = Presence.where(curso: params[:id])

  end

  def create_multiple
    if params[:users_ids].present?
      @usuarios = User.find(params[:users_ids])
      @usuario_last = @usuarios.last.cursos.last.id #pasar id del curso a la mala
      @usuarios.each do |t|
        t.presences.create(asistio: true, fecha: Date.today.to_s, curso_id: @usuario_last)
      end
      flash[:notice] = "Asistencias creadas correctamente"
    else
      flash[:alert] = "Asistencias no creadas, no a seleccionado a alumnos"
    end
    redirect_to profesor_presences_path
  end

  # GET /presences/new
  def new
    @presence = Presence.new
  end

  # GET /presences/1/edit
  def edit
  end

  # POST /presences
  # POST /presences.json
  def create
    @presence = Presence.new(presence_params)

    respond_to do |format|
      if @presence.save
        format.html { redirect_to profesor_presence_path(@presence), notice: 'Asistencia correctamente creada.' }
        format.json { render :show, status: :created, location: @profesor_presence }
      else
        format.html { render :new }
        format.json { render json: @presence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /presences/1
  # PATCH/PUT /presences/1.json
  def update
    respond_to do |format|
      if @presence.update(presence_params)
        format.html { redirect_to profesor_presence_path, notice: 'Asistencia correctamente modificada.' }
        format.json { render :show, status: :ok, location: @presence }
      else
        format.html { render :edit }
        format.json { render json: @presence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /presences/1
  # DELETE /presences/1.json
  def destroy
    @presence.destroy
    respond_to do |format|
      format.html { redirect_to profesor_presences_url, notice: 'Asistencia correctamente borrada.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_presence
      @presence = Presence.find_by(params[:presence_id])
    end

    def presence_params
      params.fetch(:presence, {})
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def presence_params
      params.require(:presence).permit(:asistio, :fecha, :user_id)
    end

    def authenticate_profesor
      unless current_user.has_role? :profesor
        flash[:alert] = "No tienes permisos necesarios para ver esta sección."
        redirect_to root_path
      end
    end
end
