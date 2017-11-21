class CreatePresences < ActiveRecord::Migration[5.0]
  def change
    create_table :presences do |t|
      t.boolean :asistio
      t.date :fecha
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
