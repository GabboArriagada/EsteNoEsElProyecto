class Tema < ApplicationRecord
  belongs_to :asignatura, :dependent => :destroy
  belongs_to :curso
  belongs_to :user
end
