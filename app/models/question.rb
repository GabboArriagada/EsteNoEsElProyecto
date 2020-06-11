class Question < ApplicationRecord
  belongs_to :user
  belongs_to :tema
  has_many :answers, dependent: :delete_all
  validates :content, length: { maximum: 50 }
end
