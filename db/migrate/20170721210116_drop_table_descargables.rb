class DropTableDescargables < ActiveRecord::Migration[5.0]
  def change
    drop_table :descargables
  end
end
