class User < ApplicationRecord
  rolify

  has_many :questions
  has_many :answers
  has_many :notas
  has_many :relationships
  has_and_belongs_to_many :cursos
  has_and_belongs_to_many :asignaturas
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  def nota_final
    notaf = 0.0
    self.asignaturas.each do |asignatura|
      notaf = asignatura.nota_final
    end
    return notaf
  end
end
