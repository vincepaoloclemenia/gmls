class Supplier < ActiveRecord::Base
  acts_as_paranoid 

  #relationships
  has_many :supplier_items, dependent: :destroy
  has_many :rfq_supplier_items, dependent: :destroy
  has_many :purchase_orders
  belongs_to :supplier_category
  belongs_to :location


  #validations
  validates :name, :email, :address, :telephone_number, presence: true
end
