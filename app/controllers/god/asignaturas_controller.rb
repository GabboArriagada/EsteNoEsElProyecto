class God::AsignaturasController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  def index
    @asignaturas = Asignatura.all
  end
  def show
    @asignatura = Asignatura.find(params[:id])
    @profesor_assigned = @asignatura.users.with_role:profesor
    @alumnos_assigned = @asignatura.users.with_role:alumno
    @alumnos = User.with_role:alumno
    @profesores = User.with_role:profesor
  end

  def new
    @asignatura = Asignatura.new
  end

  def create
    @asignatura = Asignatura.new(asignatura_params)
    respond_to do |format|
      if @asignatura.save
        format.html { redirect_to god_asignaturas_path, notice: 'La asignatura ha sido ingresada' }
        format.json { render :show, status: :created, location: @asignatura }
      else
        format.html { render :new }
        format.json { render json: @asignatura.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def asignar
    @asignatura = Asignatura.find(params[:asignatura])
    @user = User.find(params[:user])
    if @asignatura.users.exists?(:id => @user.id)
      redirect_to action: "show", id: @asignatura.id
    else
      @asignatura.users << @user
      redirect_to action: "show", id: @asignatura.id
    end
  end

  def desasignar
    @asignatura = Asignatura.find(params[:asignatura])
    @user = User.find(params[:user])
    @asignatura.users.delete(@user)
    if @asignatura.users.exists?(:id => @user.id)
      redirect_to action: "show", id: @asignatura.id
    else
      redirect_to action: "show", id: @asignatura.id
    end
  end

  private
  def asignatura_params
    params.required(:asignatura).permit(:nombre,:año)
  end
    def authenticate_admin
      unless current_user.has_role? :admin
        flash[:error] = "No tienes permisos necesarios para ver esta sección."
        redirect_to root_path
      end
    end
end
