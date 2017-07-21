class AddDatosToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :direccion, :string
    add_column :users, :rut, :integer
    add_column :users, :fecha_nacimiento, :integer
    add_column :users, :telefono, :integer
    add_column :users, :fecha_ingreso, :integer
    add_column :users, :sexo, :string
  end
end
