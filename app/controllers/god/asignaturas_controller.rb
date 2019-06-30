class God::AsignaturasController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin

  def index
    @asignaturas = Asignatura.all.joins(:curso).merge(Curso.order(grado: :desc))
  end
  def show
    @asignatura = Asignatura.find(params[:id])
    @profesor_assigned = @asignatura.users.with_role:profesor
    @alumnos_assigned = @asignatura.users.with_role:alumno
    @alumnos = User.where(curso_id: @asignatura.curso.id).with_role:alumno
    @profesores = User.with_role:profesor
    @cursos = Curso.where(año: @asignatura.año)
  end

  def new
    @dias_semana = ["Lunes","Martes","Miercoles","Jueves","Viernes"]
    @hora_inicio = ["08:10","08:55","10:00","10:45","11:40","12:25","13:10","14:40","15:20"]
    @hora_fin = ["08:55","09:40","10:45","11:30","12:25","13:10","13:55","15:25","16:10"]
    @numero_bloque = [1,2,3,4,5,6,7,8,9]
    @asignatura = Asignatura.new
    bloque = @asignatura.bloques.build
    @cursos = Curso.where(año: Date.current.year)
  end

  def create
    @numero_bloque = [1,2,3,4,5,6,7,8,9]
    @dias_semana = ["Lunes","Martes","Miercoles","Jueves","Viernes"]
    @hora_inicio = ["08:10","08:55","10:00","10:45","11:40","12:25","13:10","14:40","15:20"]
    @hora_fin = ["08:55","09:40","10:45","11:30","12:25","13:10","13:55","15:25","16:10"]
    @asignatura = Asignatura.new(asignatura_params)
    @curso = Curso.find(@asignatura.curso_id)
    @curso.users.each do |user|
      @asignatura.users << user
    end
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
    @dias_semana = ["Lunes","Martes","Miercoles","Jueves","Viernes"]
    @hora_inicio = ["08:10","08:55","10:00","10:45","11:40","12:25","13:10","14:40","15:20"]
    @hora_fin = ["08:55","09:40","10:45","11:30","12:25","13:10","13:55","15:25","16:10"]
    @numero_bloque = [1,2,3,4,5,6,7,8,9]
    @asignatura = Asignatura.find(params[:id])
    @curso = @asignatura.curso
    @cursos = Curso.where(año: Date.current.year)

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
    params.required(:asignatura).permit(:nombre,:año,:curso_id, :bloques_attributes => [:id, :numero_bloque, :dia, :hora_inicio, :hora_fin, :asignatura_id], :ponderacions_attributes => [:id, :valor, :asignatura_id])
  end
    def authenticate_admin
      unless current_user.has_role? :admin
        flash[:error] = "No tienes permisos necesarios para ver esta sección."
        redirect_to root_path
      end
    end
end
