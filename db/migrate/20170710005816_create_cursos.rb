class CreateCursos < ActiveRecord::Migration[5.0]
  def change
    create_table :cursos do |t|
      t.string :nombre
      t.integer :año

      t.timestamps
    end
  end
end
