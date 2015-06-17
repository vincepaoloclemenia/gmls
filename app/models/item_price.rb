class ItemPrice < ActiveRecord::Base
	acts_as_paranoid
  #relationships
  belongs_to :item

  default_scope -> { order('created_at DESC') }
end
