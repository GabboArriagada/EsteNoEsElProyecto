class AddDefaultValueToEsApoderado < ActiveRecord::Migration[5.0]
  def up
  change_column :users, :es_apoderado, :boolean, default: false
  end
end
