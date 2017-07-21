class AddReferencesToPosts < ActiveRecord::Migration[5.0]
  def change
    add_reference :posts, :asignatura, foreign_key: true
  end
end
