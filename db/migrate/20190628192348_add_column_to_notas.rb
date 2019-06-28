class AddColumnToNotas < ActiveRecord::Migration[5.0]
  def change
    add_column :notas, :ponderacion_id, :integer
  end
end
