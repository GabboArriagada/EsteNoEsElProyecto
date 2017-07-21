class Asignatura < ApplicationRecord
  belongs_to :curso
  has_many :posts
  has_many :notas
  accepts_nested_attributes_for :notas , reject_if: :all_blank , allow_destroy: true
end
