class God::CursosController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  def index
    @cursos = Curso.all
  end
  def show
    @curso = Curso.find(params[:id])
    @profesor_assigned = @curso.users.with_role:profesor
    @alumnos_assigned = @curso.users.with_role:alumno
    @alumnos = User.where(curso_id: nil).with_role:alumno
    @profesores = User.with_role:profesor
  end

  def assign
    @cursos = Curso.all
  end

  def new
    @curso = Curso.new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def create
    @curso = Curso.new(curso_params)
    respond_to do |format|
      if @curso.save
        format.html { redirect_to god_cursos_path, notice: 'El curso ha sido ingresado' }
        format.json { render :show, status: :created, location: @curso }
      else
        format.html { render :new }
        format.json { render json: @curso.errors, status: :unprocessable_entity }
      end
    end
  end


  def asignar
    @curso = Curso.find(params[:curso])
    @user = User.find(params[:user])
    @asignaturas = Asignatura.where(curso_id: @curso.id)
    @asignaturas.each do |asignatura|
      asignatura.users << @user
    end
    @user.curso_id = @curso.id
    @user.save
    if @curso.users.exists?(:id => @user.id)
      redirect_to action: "show", id: @curso.id
    else
      @curso.users << @user
      redirect_to action: "show", id: @curso.id
    end
  end

  def desasignar
    @curso = Curso.find(params[:curso])
    @user = User.find(params[:user])
    @asignaturas = Asignatura.where(curso_id: @curso.id)
    @asignaturas.each do |asignatura|
      asignatura.users.delete(@user)
    end
    @curso.users.delete(@user)
    @user.curso_id = nil
    @user.save
    if @curso.users.exists?(:id => @user.id)

      redirect_to action: "show", id: @curso.id
    else
      redirect_to action: "show", id: @curso.id
    end
  end

  private
  def curso_params
    params.required(:curso).permit(:grado, :año, :letra_codigo)
  end
    def authenticate_admin
      unless current_user.has_role? :admin
        flash[:error] = "No tienes permisos necesarios para ver esta sección."
        redirect_to root_path
      end
    end
end
