class Asignatura < ApplicationRecord
  belongs_to :curso
  has_and_belongs_to_many :users
  has_many :posts
  has_many :notas
  accepts_nested_attributes_for :notas , reject_if: :all_blank , allow_destroy: true

  def title
    "#{nombre}"
  end
end
