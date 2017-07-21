class RemoveTablasInnecesarias < ActiveRecord::Migration[5.0]
  def change
    drop_table :administradors
    drop_table :alumno_profesors
    drop_table :alumnos
    drop_table :asignatura_alumnos
    drop_table :asignatura_profesors
    drop_table :logins
    drop_table :profesors
  end
end
