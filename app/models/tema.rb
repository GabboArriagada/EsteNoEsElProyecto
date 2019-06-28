class Tema < ApplicationRecord
  belongs_to :asignatura
  belongs_to :curso
  belongs_to :user
end
