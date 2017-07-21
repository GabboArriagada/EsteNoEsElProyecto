class RenameTableUsersCursosToCursosUsers < ActiveRecord::Migration[5.0]
  def change
    rename_table :users_cursos, :cursos_users
  end
end
