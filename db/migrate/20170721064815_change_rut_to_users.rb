class ChangeRutToUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :rut, :string
  end
end
