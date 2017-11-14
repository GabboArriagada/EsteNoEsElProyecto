class Asignatura < ApplicationRecord
  belongs_to :curso
  has_and_belongs_to_many :users
  has_many :posts, :dependent => :destroy
  has_many :notas, :dependent => :destroy
  accepts_nested_attributes_for :notas , reject_if: :all_blank , allow_destroy: true
  validates :nombre, presence: true, format: { with: /\A[a-zA-Z]+\z/,
    message: "Solo se permite letras" }
  validates :año, presence: true, length: { is: 4 }, numericality: { only_integer: true, greater_than_or_equal_to: 2017}







  def title
    "#{nombre}"
  end
end
