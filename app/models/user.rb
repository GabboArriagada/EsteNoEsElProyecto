class User < ApplicationRecord
  include Filterable
  rolify

  has_many :presences, :dependent => :destroy
  has_many :questions, :dependent => :destroy
  has_many :answers, :dependent => :destroy
  has_many :notas, :dependent => :destroy
  has_many :relationships
  has_many :temas
  has_and_belongs_to_many :cursos, :dependent => :destroy
  has_and_belongs_to_many :asignaturas, :dependent => :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :telefono, length: { is: 9 }, numericality: { only_integer: true}
  validates :direccion, length: { maximum: 100 }
  validates :name, presence: true, format: { with: /\A[a-zA-Z]+\z/,
            message: "Solo se permite letras" }
  validates :last_name, presence: true, format: { with: /\A[a-zA-Z]+\z/,
            message: "Solo se permite letras" }
validates   :rut, uniqueness: true

scope :search, -> (search) { where('lower(name) LIKE ?', "%#{search.to_s.downcase}%")}
scope :by_id, -> (id) { where(:id => id)}
scope :by_rut, -> (rut) { where("rut like ?", "%#{rut}%")}
scope :by_nombre, -> (name) { where("name ilike ?", "%#{name}%")}
scope :by_rol, -> (rol) { joins(:roles).where("roles.id = ?", rol)}



  def nota_final
    notaf = 0.0
    self.asignaturas.each do |asignatura|
      notaf = asignatura.nota_final
    end
    return notaf
  end

end
