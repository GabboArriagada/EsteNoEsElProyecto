class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :relation, :class_name => 'User', :foreign_key => 'relation_id'
end
