class Nota < ApplicationRecord
  self.table_name = "notas"
  belongs_to :asignatura
  belongs_to :user
  has_one :ponderacion
  validates :nota, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 10, less_than_or_equal_to: 70}
  validates :porcentaje, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 100 }
end

#:greater_than_or_equal_to
#:less_than_or_equal_to
