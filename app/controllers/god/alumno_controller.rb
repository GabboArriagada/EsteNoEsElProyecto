class God::AlumnoController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  def index
    @alumnos = User.with_role:alumno
  end

  def edit
  end

  def update
    @event.update(event_params)
  end

  def destroy
    @user.destroy
  end

  private

    def authenticate_admin
      unless current_user.has_role? :admin
        flash[:error] = "No tienes permisos necesarios para ver esta sección."
        redirect_to root_path
      end
    end
end
