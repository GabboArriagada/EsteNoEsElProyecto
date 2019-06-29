class Configuraciones::UsuariosController < ApplicationController
	before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin

  def index
    @usuarios = User.all
    @usuarios = @usuarios.filter(params.slice(:by_id,:by_nombre,:by_rut, :by_rol))
		@roles = Role.all
  end

  def new
    @usuario= User.new
  end

  def edit
  end

  def show
  end


  def create
    @usuario = User.new(usuario_params)

    respond_to do |format|
      if @usuario.save
        format.html { redirect_to configuraciones_usuario_path(@usuario), notice: 'Usuario creado correctamente.' }
        format.json { render :show, status: :created, location: @usuario }
      else
        format.html { render :new }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
		if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
			params[:user].delete(:password)
			params[:user].delete(:password_confirmation)
		end
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to configuraciones_usuario_path(@usuario), notice: 'Usuario actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @usuario }
      else
        format.html { render :edit }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
      @usuario.destroy
      respond_to do |format|
        format.html { redirect_to configuraciones_usuarios_url, notice: 'Usuario eliminado correctamente.' }
        format.json { head :no_content }
      end

  end

  private

    def set_usuario
      @usuario = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      params.require(:user).permit!
    end



		def authenticate_admin
			unless current_user.has_role? :admin
				flash[:error] = "No tienes permisos necesarios para ver esta sección."
				redirect_to root_path
			end
		end
end
