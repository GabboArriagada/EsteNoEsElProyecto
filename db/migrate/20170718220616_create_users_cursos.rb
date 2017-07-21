class CreateUsersCursos < ActiveRecord::Migration[5.0]
  def change
    create_table :users_cursos do |t|
      t.references :user, foreign_key: true
      t.references :curso, foreign_key: true

      t.timestamps
    end
  end
end
