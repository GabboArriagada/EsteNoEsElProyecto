class CreatePonderacions < ActiveRecord::Migration[5.0]
  def change
    create_table :ponderacions do |t|
      t.integer :valor
      t.references :asignatura, foreign_key: true
      t.timestamps
    end
  end
end
