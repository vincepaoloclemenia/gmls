class Item < ActiveRecord::Base
  acts_as_paranoid
  attr_accessor :category_name, :sub_category_name

  #relations
  belongs_to :category
  belongs_to :sub_category
  has_many :item_prices
  has_many :supplier_items, dependent: :destroy
  has_many :rfq_supplier_items, dependent: :destroy
  has_many :item_location_prices, dependent: :destroy
  
  #validations
  # :item_type == 'Services' ? (validates_presence_of :name) : (validates_presence_of :name, :unit_price, :package_size)
  if :item_type == "Services"
    validates_presence_of :name
  else
    validates_presence_of :name, :unit_price, :package_size, :unit_of_issue
  end

  validates_uniqueness_of :name, :case_sensitive => false

  #callbacks
  after_create :initial_price
  after_update :update_price_history

  protected
  
  # Will Refactor This

  def initial_price
    item_price = self.item_prices.build
    item_price.price = self.unit_price
    item_price.save
  end

  def update_price_history
    last_item_price = self.item_prices.first.price
    if last_item_price.to_f != self.unit_price.to_f
      item_price = self.item_prices.build
      item_price.price = self.unit_price
      item_price.save
    end
  end  
end
