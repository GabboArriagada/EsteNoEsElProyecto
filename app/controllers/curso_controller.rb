class CursoController < ApplicationController
  before_action :authenticate_user!
  def horario
    @asignaturas = current_user.asignaturas
  end


end
