class ChangeNameOfCursos < ActiveRecord::Migration[5.0]
  def change
    rename_column :cursos, :nombre, :grado
    add_column :cursos, :letra_codigo, :string
  end
end
