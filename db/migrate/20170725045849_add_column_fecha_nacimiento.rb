class AddColumnFechaNacimiento < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :fecha_nacimiento, :date
  end
end
