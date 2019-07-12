class Ponderacion < ApplicationRecord
  belongs_to :asignatura, :dependent => :destroy
  has_many :notas
end
