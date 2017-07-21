class CreateNota < ActiveRecord::Migration[5.0]
  def change
    create_table :notas do |t|
      t.text :descripcion
      t.integer :nota
      t.integer :porcentaje
      t.references :user, foreign_key: true
      t.references :asignatura, foreign_key: true

      t.timestamps
    end
  end
end
