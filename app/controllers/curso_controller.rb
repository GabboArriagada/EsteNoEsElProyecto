class CursoController < ApplicationController
  before_action :authenticate_user!
  def horario
    @asignaturas = current_user.asignaturas
    respond_to do |format|
      format.html
      format.json
      format.pdf {render template: 'curso/pdf', pdf: 'Horario'}
    end
  end


end
