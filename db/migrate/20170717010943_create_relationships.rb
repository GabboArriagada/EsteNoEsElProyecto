class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.references :user, foreign_key: true
      t.integer :relation_id

      t.timestamps
    end
    add_index :relationships, ['relation_id'], name: 'index_relationships_on_relation_id', using: :btree
  end
end
