class Profesor::PresencesController < ApplicationController
  before_action :set_presence, only: [:show, :edit, :update, :destroy]

  # GET /presences
  # GET /presences.json
  def index
    @presences = Presence.all
  end

  # GET /presences/1
  # GET /presences/1.json
  def show
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
        format.html { redirect_to profesor_presence_path(@presence), notice: 'Presence was successfully created.' }
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
        format.html { redirect_to profesor_presence_path, notice: 'Presence was successfully updated.' }
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
      format.html { redirect_to profesor_presences_url, notice: 'Presence was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_presence
      @presence = Presence.find_by(params[:presence_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def presence_params
      params.require(:presence).permit(:asistio, :fecha, :user_id)
    end
end
