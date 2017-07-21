class RemoveUserIdToCursos < ActiveRecord::Migration[5.0]
  def change
    remove_column :cursos, :user_id, :integer
  end
end
