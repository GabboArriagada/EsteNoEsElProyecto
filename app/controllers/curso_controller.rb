class CursoController < ApplicationController
  before_action :authenticate_user!
  def horario
    @asignaturas = current_user.asignaturas
    if current_user.es_apoderado?
      @asignaturas = User.find(current_user.alumno_id).asignaturas
    end
    respond_to do |format|
      format.html
      format.json
      format.pdf {render template: 'curso/pdf', pdf: 'Horario'}
    end
  end


def foro
  @asignatura = Asignatura.find(params[:asignatura])
end

end
