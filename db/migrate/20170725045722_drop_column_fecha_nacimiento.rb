class DropColumnFechaNacimiento < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :fecha_nacimiento
  end
end
