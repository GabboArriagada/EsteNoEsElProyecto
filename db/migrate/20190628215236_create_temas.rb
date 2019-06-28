class CreateTemas < ActiveRecord::Migration[5.0]
  def change
    create_table :temas do |t|
      t.string :titulo
      t.references :asignatura, foreign_key: true
      t.references :curso, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
