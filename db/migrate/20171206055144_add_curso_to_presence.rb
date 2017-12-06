class AddCursoToPresence < ActiveRecord::Migration[5.0]
  def change
    add_reference :presences, :curso, foreign_key: true
  end
end
