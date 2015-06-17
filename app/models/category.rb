class Category < ActiveRecord::Base
  acts_as_paranoid
  #relationships
  has_many :sub_categories, dependent: :destroy
  has_many :items, dependent: :destroy

  #validations
  validates :name, presence: true
end
