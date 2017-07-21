class Nota < ApplicationRecord
  self.table_name = "notas"
  belongs_to :asignatura
  belongs_to :user
end
