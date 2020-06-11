class Tema < ApplicationRecord
  belongs_to :asignatura
  belongs_to :curso
  belongs_to :user
  has_many :questions, dependent: :delete_all
end
