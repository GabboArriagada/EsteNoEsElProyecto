class AddCursoToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :curso, foreign_key: true
  end
end
