class Curso < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :presences
  has_many :asignaturas, :dependent => :destroy
  accepts_nested_attributes_for :asignaturas
  #accept_nested_attributes_for :asignatura , reject_if: :all_blank , allow_destroy: true
  #links
  #http://api.rubyonrails.org/classes/ActiveRecord/NestedAttributes/ClassMethods.html
  #https://github.com/nathanvda/cocoon
  #https://github.com/ryanb/nested_form
  #https://rubyplus.com/articles/3681-Complex-Forms-in-Rails-5
  #https://www.sitepoint.com/better-nested-attributes-in-rails-with-the-cocoon-gem/

  validates :grado, presence: true, :inclusion => {:in => [1,2,3,4,5,6,7,8] }#Cursos desde 1 a 8 basico
  validates :letra_codigo, presence: true,:inclusion => {in: %w(a b c d A B C D) } #Letras permitidas
  validates :año, presence: true, length: { is: 4 }, numericality: { only_integer: true}
  validates :grado, uniqueness: {scope: [:letra_codigo, :año], message: "Curso, grado y letra, ya existe en este año"}
  validate :validar_año

  def tittle
    "#{nombre}"
  end
  #para que cuando guarde sea siempre mayuscula la letra
  def letra_codigo=(val)
    write_attribute :letra_codigo, val.upcase
  end

  def validar_año
    if año != Date.current.year
      errors.add(:año,"Año incorrecto, debe ser el actual")
    end
  end
end
