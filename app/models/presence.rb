class Presence < ApplicationRecord
  belongs_to :user
  validates :fecha, uniqueness: { scope: [:user_id] }
  validates :user_id, presence: true
end
