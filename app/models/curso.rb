class Curso < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :asignaturas
  accepts_nested_attributes_for :asignaturas
  #accept_nested_attributes_for :asignatura , reject_if: :all_blank , allow_destroy: true
  #links
  #http://api.rubyonrails.org/classes/ActiveRecord/NestedAttributes/ClassMethods.html
  #https://github.com/nathanvda/cocoon
  #https://github.com/ryanb/nested_form
  #https://rubyplus.com/articles/3681-Complex-Forms-in-Rails-5
  #https://www.sitepoint.com/better-nested-attributes-in-rails-with-the-cocoon-gem/

  def tittle
    "#{nombre}"    
  end
end
