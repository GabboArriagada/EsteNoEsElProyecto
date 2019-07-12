class Bloque < ApplicationRecord
belongs_to :asignatura, :dependent => :destroy
end
