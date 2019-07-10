class Asignatura < ApplicationRecord
  belongs_to :curso
  has_and_belongs_to_many :users
  has_many :posts, :dependent => :destroy
  has_many :notas
  has_many :bloques, :dependent => :destroy
  has_many :ponderacions, :dependent => :destroy
  has_many :temas, :dependent => :destroy
  accepts_nested_attributes_for :notas , reject_if: :all_blank , allow_destroy: true
  validates :nombre, presence: true, format: { with: /\A[a-zA-Z ]+\Z/,
    message: "Solo se permite letras" }
  validates :año, presence: true, length: { is: 4 }, numericality: { only_integer: true}
  validates :nombre, uniqueness: {scope: [:curso_id], message: "Asignatura ya está en el curso"}
  validate :validar_año
  accepts_nested_attributes_for :bloques , reject_if: :all_blank , allow_destroy: true
  accepts_nested_attributes_for :ponderacions , reject_if: :all_blank , allow_destroy: true

  def title
    "#{nombre}"
  end
  def validar_año
    if año != Date.current.year
      errors.add(:año,"Año incorrecto, debe ser el actual")
    end
  end

  def nombre=(s)
    write_attribute(:nombre,s.to_s.upcase)
  end
end
