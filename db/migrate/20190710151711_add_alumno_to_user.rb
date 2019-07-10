class AddAlumnoToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :alumno_id, :integer
    add_column :users, :es_apoderado, :boolean
  end
end
