class IncidentalItem < ActiveRecord::Base
  acts_as_paranoid
  belongs_to :incidental_quote
  belongs_to :item
  belongs_to :supplier_pricing_detail
  belongs_to :service
  belongs_to :location
end
