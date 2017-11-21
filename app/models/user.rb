class User < ApplicationRecord
  rolify

  has_many :presences, :dependent => :destroy
  has_many :questions, :dependent => :destroy
  has_many :answers, :dependent => :destroy
  has_many :notas, :dependent => :destroy
  has_many :relationships, :dependent => :destroy
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
  def nota_final
    notaf = 0.0
    self.asignaturas.each do |asignatura|
      notaf = asignatura.nota_final
    end
    return notaf
  end

end
