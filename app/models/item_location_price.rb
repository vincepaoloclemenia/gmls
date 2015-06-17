class ItemLocationPrice < ActiveRecord::Base

  #relationships
  belongs_to :item
  has_many :rfq_item

end
