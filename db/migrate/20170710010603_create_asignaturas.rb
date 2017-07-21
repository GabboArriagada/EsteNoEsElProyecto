class CreateAsignaturas < ActiveRecord::Migration[5.0]
  def change
    create_table :asignaturas do |t|
      t.string :nombre
      t.integer :año
      t.belongs_to :curso, foreign_key: true

      t.timestamps
    end
  end
end
