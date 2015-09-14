class Supplier < ActiveRecord::Base
  acts_as_paranoid 

  #relationships
  has_many :supplier_items, dependent: :destroy
  has_many :rfq_supplier_items, dependent: :destroy
  has_many :purchase_orders
  belongs_to :supplier_category
  belongs_to :location
  has_many :rfq_items

  #validations
  validates_presence_of :name, :address
  validates_uniqueness_of :name
  # validates_format_of :mobile_number , :with => /[^a-z]+$/, :multiline => true, presence: false
end
