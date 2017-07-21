class User < ApplicationRecord
  rolify


  has_many :questions
  has_many :answers
  has_many :notas
  has_many :relationships
  has_and_belongs_to_many :cursos
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
