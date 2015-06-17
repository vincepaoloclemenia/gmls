class Rfq < ActiveRecord::Base
  acts_as_paranoid	
  
  attr_accessor :principal_name, :monitoring_officer_name, :requirements_officer_name 

  #relationships
  belongs_to :principal
  has_many :rfq_items, dependent: :destroy
  has_many :rfq_supplier_items, dependent: :destroy
  belongs_to :monitoring_officer, class_name: "User", foreign_key: "monitoring_officer_id"
  belongs_to :requirements_officer, class_name: "User", foreign_key: "requirements_officer_id"
  has_many :purchase_orders
  
  #validations
  validates :title, :principal_id, :step, :sub_step, presence: true
end
