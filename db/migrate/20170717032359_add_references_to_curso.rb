class AddReferencesToCurso < ActiveRecord::Migration[5.0]
  def change
    add_reference :cursos, :user, foreign_key: true
  end
end
