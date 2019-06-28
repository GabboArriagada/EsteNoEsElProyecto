class Ponderacion < ApplicationRecord
  belongs_to :asignatura
  has_many :notas
end
