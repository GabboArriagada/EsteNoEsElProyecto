class Answer < ApplicationRecord
  belongs_to :question, :dependent => :destroy
  belongs_to :user
  validates :content, presence: true
  validates :content, length: { maximum: 100 }
end
