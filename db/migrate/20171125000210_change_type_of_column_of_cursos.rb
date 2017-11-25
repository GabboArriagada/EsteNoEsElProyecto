class ChangeTypeOfColumnOfCursos < ActiveRecord::Migration[5.0]
  def change
    change_column :cursos, :grado, 'integer USING CAST(grado AS integer)'
  end
end
