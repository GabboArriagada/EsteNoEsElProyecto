class CreateBloques < ActiveRecord::Migration[5.0]
  def change
    create_table :bloques do |t|
      t.integer :numero_bloque
      t.string :dia
      t.time :hora_inicio
      t.time :hora_fin
      t.references :asignatura, foreign_key: true

      t.timestamps
    end
  end
end
