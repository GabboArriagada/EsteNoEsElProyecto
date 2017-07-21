class CreateDescargables < ActiveRecord::Migration[5.0]
  def change
    create_table :descargables do |t|
      t.string :titulo
      t.integer :fecha
      t.string :asignatura
      t.text :campo_descriptivo

      t.timestamps
    end
  end
end
