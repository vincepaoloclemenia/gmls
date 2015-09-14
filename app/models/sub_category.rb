class SubCategory < ActiveRecord::Base
	acts_as_paranoid
  attr_accessor :category_name

  #relationships
  belongs_to :category
  has_many :items, dependent: :destroy

  #validations
  validates_presence_of :name
  validates_uniqueness_of :name, :case_sensitive => false
end
