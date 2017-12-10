class Presence < ApplicationRecord
  belongs_to :user
  belongs_to :curso
  validates :fecha, uniqueness: { scope: [:user_id] }
  validates :user_id, presence: true
  self.per_page = 3

  include PgSearch
  pg_search_scope :search, against: [:user_id, :fecha],
  associated_against: {user: [:name, :last_name]},
  ignoring: :accents

  def self.text_search(query)
      if query.present?
        search(query)
      else
        all
      end
  end
end
