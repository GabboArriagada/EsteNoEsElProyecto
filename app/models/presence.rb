class Presence < ApplicationRecord
  belongs_to :user
  belongs_to :curso
  validates :fecha, uniqueness: { scope: [:user_id] }
  validates :user_id, presence: true
end
