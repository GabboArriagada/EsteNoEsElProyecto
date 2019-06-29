class AddTemaToQuestion < ActiveRecord::Migration[5.0]
  def change
    add_reference :questions, :tema, foreign_key: true
  end
end
