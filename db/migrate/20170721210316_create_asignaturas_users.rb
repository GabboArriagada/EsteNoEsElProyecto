class CreateAsignaturasUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :asignaturas_users do |t|
      t.references :user, foreign_key: true
      t.references :asignatura, foreign_key: true
    end
  end
end
